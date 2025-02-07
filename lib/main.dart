// main.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const WeddingApp());
}

class WeddingApp extends StatelessWidget {
  const WeddingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wedding Invitation',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        textTheme: GoogleFonts.playfairDisplayTextTheme(),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/hero_background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.5),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sarah & John',
                      style: GoogleFonts.greatVibes(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'ARE GETTING MARRIED',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        letterSpacing: 4,
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'AUGUST 15, 2025',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Navigation Menu
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NavButton(
                    icon: Icons.favorite,
                    label: 'Our Story',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OurStoryScreen()),
                    ),
                  ),
                  NavButton(
                    icon: Icons.calendar_today,
                    label: 'Events',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EventsScreen()),
                    ),
                  ),
                  NavButton(
                    icon: Icons.mail,
                    label: 'RSVP',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RsvpScreen()),
                    ),
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

class NavButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const NavButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28, color: Theme.of(context).primaryColor),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

// our_story_screen.dart
class OurStoryScreen extends StatelessWidget {
  const OurStoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Story'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/couple.jpg',
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'How We Met',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 15),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 30),
            Text(
              'The Proposal',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 15),
            Text(
              'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

// events_screen.dart
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
          ),
          SizedBox(height: 20),
          EventCard(
            title: 'Reception',
            date: 'August 15, 2025',
            time: '5:00 PM',
            location: 'Grand Hotel Ballroom',
            address: '456 Celebration Ave, City',
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

  const EventCard({
    super.key,
    required this.title,
    required this.date,
    required this.time,
    required this.location,
    required this.address,
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
          ],
        ),
      ),
    );
  }
}

// rsvp_screen.dart
class RsvpScreen extends StatefulWidget {
  const RsvpScreen({super.key});

  @override
  _RsvpScreenState createState() => _RsvpScreenState();
}

class _RsvpScreenState extends State<RsvpScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  int _numberOfGuests = 1;
  bool _isAttending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RSVP'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Please let us know if you can make it',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) => _name = value ?? '',
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) => _email = value ?? '',
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<int>(
                decoration: const InputDecoration(
                  labelText: 'Number of Guests',
                  border: OutlineInputBorder(),
                ),
                value: _numberOfGuests,
                items: List.generate(5, (index) => index + 1)
                    .map((number) => DropdownMenuItem(
                          value: number,
                          child: Text('$number'),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _numberOfGuests = value ?? 1;
                  });
                },
              ),
              const SizedBox(height: 20),
              SwitchListTile(
                title: const Text('Will you attend?'),
                value: _isAttending,
                onChanged: (value) {
                  setState(() {
                    _isAttending = value;
                  });
                },
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Submit RSVP',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // Here you would typically send the RSVP data to your backend
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Thank you for your RSVP!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }
}
