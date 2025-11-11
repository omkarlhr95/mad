import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'image_display.dart';
import 'package:image_picker/image_picker.dart';

class ImageFormScreen extends StatefulWidget {
  const ImageFormScreen({Key? key}) : super(key: key);

  @override
  State<ImageFormScreen> createState() => _ImageFormScreenState();
}

class _ImageFormScreenState extends State<ImageFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _urlController = TextEditingController();

  String _imageSource = 'Asset';
  String? _assetImagePath;
  final ImagePicker _picker = ImagePicker();

  Widget _buildImagePreview() {
    if (_imageSource == 'Network' && _urlController.text.isNotEmpty) {
      return Image.network(_urlController.text, height: 200, fit: BoxFit.cover);
    } else if (_imageSource == 'Asset' && _assetImagePath != null) {
      return Image.asset(_assetImagePath!, height: 200, fit: BoxFit.cover);
    } else {
      return const Icon(Icons.image, size: 200, color: Colors.grey);
    }
  }

  Future<void> _pickAssetImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _assetImagePath = pickedFile.path;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String imagePath = _imageSource == 'Network'
          ? _urlController.text
          : _assetImagePath ?? '';

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImageDisplayScreen(
            imagePath: imagePath,
            source: _imageSource,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Image')),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Add Image',
                style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Image Title'),
                validator: (value) => value!.isEmpty ? 'Enter title' : null,
              ),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) => value!.isEmpty ? 'Enter description' : null,
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Asset'),
                      value: 'Asset',
                      groupValue: _imageSource,
                      onChanged: (value) => setState(() => _imageSource = value!),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Network'),
                      value: 'Network',
                      groupValue: _imageSource,
                      onChanged: (value) => setState(() => _imageSource = value!),
                    ),
                  ),
                ],
              ),
              if (_imageSource == 'Network')
                TextFormField(
                  controller: _urlController,
                  decoration: const InputDecoration(labelText: 'Image URL'),
                  validator: (value) =>
                      _imageSource == 'Network' && value!.isEmpty ? 'Enter URL' : null,
                ),
              if (_imageSource == 'Asset')
                ElevatedButton(
                  onPressed: _pickAssetImage,
                  child: const Text('Pick Asset Image'),
                ),
              const SizedBox(height: 16),
              _buildImagePreview(),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  backgroundColor: Colors.blueAccent,
                ),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
