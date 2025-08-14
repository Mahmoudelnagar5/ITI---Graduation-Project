import 'dart:io';
import 'package:final_project_iti/core/helper/cashe_helper/cashe_helper.dart';
import 'package:final_project_iti/core/helper/cashe_helper/cashe_helper_keys.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          backgroundColor: Colors.brown,
          radius: 50,
          backgroundImage: ImageSection.image != null
              ? FileImage(ImageSection.image!)
              : null,
          child: ImageSection.image == null
              ? const Icon(Icons.add_a_photo, color: Colors.black)
              : null,
        ),

        Positioned(
          right: -20,
          bottom: -4,
          child: GestureDetector(
            onTap: _pickAndSaveImage,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
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

        if (ImageSection.image != null)
          Positioned(
            right: -4,
            top: -4,
            child: GestureDetector(
              onTap: _deleteImage,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(6),
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
