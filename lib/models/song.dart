// models/song.dart
class Song {
  final String title;
  final String artist;
  final String addedBy;
  final DateTime addedAt;

  Song({
    required this.title,
    required this.artist,
    required this.addedBy,
    required this.addedAt,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'artist': artist,
        'addedBy': addedBy,
        'addedAt': addedAt.toIso8601String(),
      };

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        title: json['title'],
        artist: json['artist'],
        addedBy: json['addedBy'],
        addedAt: DateTime.parse(json['addedAt']),
      );
}
