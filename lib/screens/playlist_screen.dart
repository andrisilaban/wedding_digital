import 'package:flutter/material.dart';

import '../models/song.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  final List<Song> songs = [];
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _artistController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wedding Playlist'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                          labelText: 'Song Title',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) => value?.isEmpty ?? true
                            ? 'Please enter a song title'
                            : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _artistController,
                        decoration: const InputDecoration(
                          labelText: 'Artist',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) => value?.isEmpty ?? true
                            ? 'Please enter an artist'
                            : null,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _addSong,
                        child: const Text('Add Song Request'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];
                return ListTile(
                  title: Text(song.title),
                  subtitle: Text(song.artist),
                  trailing: Text('Added by ${song.addedBy}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _addSong() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        songs.add(Song(
          title: _titleController.text,
          artist: _artistController.text,
          addedBy: 'Guest Name', // Replace with actual guest name
          addedAt: DateTime.now(),
        ));
      });
      _titleController.clear();
      _artistController.clear();
    }
  }
}
