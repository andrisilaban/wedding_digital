class GuestBookEntry {
  final String message;
  final String name;
  final DateTime timestamp;
  final String? photoUrl;

  GuestBookEntry({
    required this.message,
    required this.name,
    required this.timestamp,
    this.photoUrl,
  });
}
