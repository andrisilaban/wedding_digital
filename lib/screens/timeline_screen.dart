import 'package:flutter/material.dart';

class TimelineScreen extends StatelessWidget {
  final List<TimelineEvent> events = [
    TimelineEvent(
      title: 'Guest Arrival',
      time: '1:30 PM',
      description: 'Guests begin arriving at the ceremony venue',
      icon: Icons.groups,
    ),
    TimelineEvent(
      title: 'Ceremony',
      time: '2:00 PM',
      description: 'Wedding ceremony begins',
      icon: Icons.favorite,
    ),
    // Add more events
  ];

  TimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wedding Timeline'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return TimelineEventCard(
            event: event,
            isFirst: index == 0,
            isLast: index == events.length - 1,
          );
        },
      ),
    );
  }
}

class TimelineEvent {
  final String title;
  final String time;
  final String description;
  final IconData icon;

  TimelineEvent({
    required this.title,
    required this.time,
    required this.description,
    required this.icon,
  });
}

class TimelineEventCard extends StatelessWidget {
  final TimelineEvent event;
  final bool isFirst;
  final bool isLast;

  const TimelineEventCard({
    super.key,
    required this.event,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          SizedBox(
            width: 72,
            child: Column(
              children: [
                Container(
                  width: 2,
                  height: 30,
                  color: isFirst
                      ? Colors.transparent
                      : Theme.of(context).primaryColor,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(event.icon, color: Colors.white, size: 20),
                ),
                Container(
                  width: 2,
                  height: 30,
                  color: isLast
                      ? Colors.transparent
                      : Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: Card(
              margin: const EdgeInsets.fromLTRB(0, 8, 16, 8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.time,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      event.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(event.description),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
