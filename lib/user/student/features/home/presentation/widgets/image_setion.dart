import 'dart:io';
import 'package:flutter/material.dart';
import 'package:final_project_iti/core/helper/cashe_helper/cashe_helper.dart';
import 'package:final_project_iti/core/helper/cashe_helper/cashe_helper_keys.dart';
import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/core/utilities/pick_images.dart';

class ImageSection extends StatefulWidget {
  const ImageSection({super.key});
  static File? image;

  @override
  State<ImageSection> createState() => _ImageSectionState();
}

class _ImageSectionState extends State<ImageSection> {
  @override
  void initState() {
    super.initState();
    _loadImageFromCache();
  }

  Future<void> _loadImageFromCache() async {
    final savedPath = await CacheHelper().getData(key: CasheKeys.userImage);
    if (savedPath != null) {
      setState(() {
        ImageSection.image = File(savedPath);
      });
    }
  }

  Future<void> _pickAndSaveImage() async {
    final pickedImage = await FuctionsPickImage.pickImageGallery();
    if (pickedImage != null) {
      await CacheHelper().saveData(
        key: CasheKeys.userImage,
        value: pickedImage.path,
      );
      setState(() {
        ImageSection.image = pickedImage;
      });
    }
  }

  Future<void> _deleteImage() async {
    await CacheHelper().removeData(key: CasheKeys.userImage);
    setState(() {
      ImageSection.image = null;
    });
  }

  void _showOptionsSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(
                  Icons.photo_camera,
                  color: Colors.blueAccent,
                ),
                title: const Text(
                  "Edit Photo",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  await _pickAndSaveImage();
                },
              ),
              if (ImageSection.image != null)
                ListTile(
                  leading: const Icon(Icons.delete, color: Colors.redAccent),
                  title: const Text(
                    "Remove Photo",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  onTap: () async {
                    Navigator.pop(context);
                    await _deleteImage();
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: CircleAvatar(
            backgroundColor: AppColors.mainColorStart,
            radius: 50,
            backgroundImage: ImageSection.image != null
                ? FileImage(ImageSection.image!)
                : null,
            child: ImageSection.image == null
                ? const Icon(Icons.person, size: 50, color: Colors.white70)
                : null,
          ),
        ),
        Positioned(
          right: -4,
          bottom: -4,
          child: GestureDetector(
            onTap: _showOptionsSheet,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
