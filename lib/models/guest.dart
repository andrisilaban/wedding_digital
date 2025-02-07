class Guest {
  final String name;
  final String email;
  final int numberOfGuests;
  final bool isAttending;

  Guest({
    required this.name,
    required this.email,
    required this.numberOfGuests,
    required this.isAttending,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'numberOfGuests': numberOfGuests,
        'isAttending': isAttending,
      };
}
