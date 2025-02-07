import 'package:flutter/material.dart';

class PhotoDetailScreen extends StatelessWidget {
  final List<String> photos;
  final int initialIndex;

  const PhotoDetailScreen({
    super.key,
    required this.photos,
    required this.initialIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            itemCount: photos.length,
            controller: PageController(initialPage: initialIndex),
            itemBuilder: (context, index) {
              return Hero(
                tag: photos[index],
                child: InteractiveViewer(
                  child: Image.asset(
                    photos[index],
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
