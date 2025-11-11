import 'package:flutter/material.dart';

class ImageDisplayScreen extends StatelessWidget {
  final String imagePath;
  final String source;

  const ImageDisplayScreen({
    Key? key,
    required this.imagePath,
    required this.source,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageWidget = source == 'Network'
        ? Image.network(imagePath, fit: BoxFit.cover)
        : Image.asset(imagePath, fit: BoxFit.cover);

    return Scaffold(
      appBar: AppBar(title: const Text('Image Display')),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 300, child: imageWidget),
            const SizedBox(height: 16),
            Text(
              'Image loaded from $source',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
