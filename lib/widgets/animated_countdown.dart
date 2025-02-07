import 'package:flutter/material.dart';

class AnimatedCountdown extends StatelessWidget {
  final DateTime weddingDate;

  const AnimatedCountdown({
    super.key,
    required this.weddingDate,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        final now = DateTime.now();
        final difference = weddingDate.difference(now);

        final days = difference.inDays;
        final hours = difference.inHours % 24;
        final minutes = difference.inMinutes % 60;
        final seconds = difference.inSeconds % 60;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CountdownItem(value: days, label: 'DAYS'),
            CountdownItem(value: hours, label: 'HOURS'),
            CountdownItem(value: minutes, label: 'MINUTES'),
            CountdownItem(value: seconds, label: 'SECONDS'),
          ],
        );
      },
    );
  }
}

class CountdownItem extends StatelessWidget {
  final int value;
  final String label;

  const CountdownItem({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value.toString().padLeft(2, '0'),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
