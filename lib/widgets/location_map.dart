import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

  void _openGoogleMaps() async {
    final Uri googleMapsUri = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');

    if (await canLaunchUrl(googleMapsUri)) {
      await launchUrl(googleMapsUri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not open the map.';
    }
  }

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
                    onPressed: _openGoogleMaps,
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
