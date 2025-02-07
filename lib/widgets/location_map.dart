// widgets/location_map.dart
import 'package:flutter/material.dart';

class LocationMap extends StatelessWidget {
  final double latitude;
  final double longitude;
  final String title;
  final String address;

  const LocationMap({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.title,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            // Add map implementation using google_maps_flutter package
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    address,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Implement navigation using maps
                    },
                    icon: const Icon(Icons.directions),
                    label: const Text('Get Directions'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
