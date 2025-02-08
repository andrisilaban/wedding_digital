import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/guest_book_entry.dart';

class GuestBookScreen extends StatefulWidget {
  const GuestBookScreen({super.key});

  @override
  _GuestBookScreenState createState() => _GuestBookScreenState();
}

class _GuestBookScreenState extends State<GuestBookScreen> {
  final List<GuestBookEntry> entries = [];
  final _messageController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guest Book'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: entries.length,
              itemBuilder: (context, index) {
                final entry = entries[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (entry.photoUrl != null)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              entry.photoUrl!,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        const SizedBox(height: 8),
                        Text(
                          entry.message,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'From: ${entry.name}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              DateFormat('MMM d, y').format(entry.timestamp),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Card(
            margin: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Your Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _messageController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Your Message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.photo_camera),
                        onPressed: () {
                          // Implement photo upload
                        },
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: _addEntry,
                        child: const Text('Add Message'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addEntry() {
    if (_messageController.text.isNotEmpty && _nameController.text.isNotEmpty) {
      setState(() {
        entries.add(GuestBookEntry(
          message: _messageController.text,
          name: _nameController.text,
          timestamp: DateTime.now(),
        ));
      });
      _messageController.clear();
      _nameController.clear();
    }
  }
}
