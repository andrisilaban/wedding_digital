// events_screen.dart
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../widgets/location_map.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wedding Events'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          EventCard(
            title: 'Wedding Ceremony',
            date: 'August 15, 2025',
            time: '2:00 PM',
            location: 'St. Mary\'s Church',
            address: '123 Wedding Lane, City',
            latitude: 40.7128, // Add your actual latitude
            longitude: -74.0060, // Add your actual longitude
          ),
          SizedBox(height: 20),
          EventCard(
            title: 'Reception',
            date: 'August 15, 2025',
            time: '5:00 PM',
            location: 'Grand Hotel Ballroom',
            address: '456 Celebration Ave, City',
            latitude: 40.7135, // Add your actual latitude
            longitude: -74.0070, // Add your actual longitude
          ),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final String location;
  final String address;
  final double latitude;
  final double longitude;

  const EventCard({
    super.key,
    required this.title,
    required this.date,
    required this.time,
    required this.location,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.calendar_today,
                    size: 16, color: Theme.of(context).primaryColor),
                const SizedBox(width: 8),
                Text(date),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.access_time,
                    size: 16, color: Theme.of(context).primaryColor),
                const SizedBox(width: 8),
                Text(time),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.location_on,
                    size: 16, color: Theme.of(context).primaryColor),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(location),
                    Text(
                      address,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            LocationMap(
              latitude: latitude,
              longitude: longitude,
              title: location,
              address: address,
            ),
          ],
        ),
      ),
    );
  }
}

class ShareButton extends StatelessWidget {
  const ShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.share),
      onPressed: () {
        Share.share(
          'Join us for our wedding celebration!\n\nSarah & John\nAugust 15, 2025\n\nRSVP at: https://your-wedding-website.com',
          subject: 'Wedding Invitation - Sarah & John',
        );
      },
    );
  }
}
