import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class PdfPickerField extends StatefulWidget {
  final Function(String?) onFilePicked;

  const PdfPickerField({super.key, required this.onFilePicked});

  @override
  State<PdfPickerField> createState() => _PdfPickerFieldState();
}

class _PdfPickerFieldState extends State<PdfPickerField> {
  String? pickedFile;

  Future<void> _pickPdf() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["pdf"],
    );

    if (result != null) {
      setState(() {
        pickedFile = result.files.single.name;
      });
      widget.onFilePicked(pickedFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OutlinedButton.icon(
          onPressed: _pickPdf,
          icon: const Icon(Icons.upload_file),
          label: const Text("Choose PDF File"),
        ),
        if (pickedFile != null) ...[
          const SizedBox(height: 8),
          Text(
            "Selected: $pickedFile",
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ],
    );
  }
}
