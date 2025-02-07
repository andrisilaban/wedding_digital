import 'package:flutter/material.dart';

import 'photo_detail_screen.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  final List<String> photos = const [
    'assets/images/gallery1.jpeg',
    'assets/images/gallery2.jpeg',
    'assets/images/gallery3.jpeg',
    'assets/images/gallery4.jpeg',
    'assets/images/gallery5.jpeg',
    'assets/images/gallery6.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Gallery'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return GalleryItem(
            imageUrl: photos[index],
            onTap: () => _showPhotoDetail(context, index),
          );
        },
      ),
    );
  }

  void _showPhotoDetail(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhotoDetailScreen(
          photos: photos,
          initialIndex: index,
        ),
      ),
    );
  }
}

class GalleryItem extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;

  const GalleryItem({
    super.key,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: imageUrl,
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: onTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
