import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/animated_countdown.dart';
import 'events_screen.dart';
import 'gallery_screen.dart';
import 'guest_book_screen.dart';
import 'nav_button.dart';
import 'our_story_screen.dart';
import 'playlist_screen.dart';
import 'rsvp_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'table_assignments_screen.dart';
import 'timeline_screen.dart';

class HomeScreen extends StatelessWidget {
  final DateTime weddingDate = DateTime(2025, 8, 15);

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section with Animated Text
            Stack(
              children: [
                // Background image container remains the same
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
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Sarah & John',
                              textStyle: GoogleFonts.greatVibes(
                                fontSize: 48,
                                color: Colors.white,
                              ),
                              speed: const Duration(milliseconds: 200),
                            ),
                          ],
                          isRepeatingAnimation: true,
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
                        AnimatedCountdown(weddingDate: weddingDate),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Enhanced Navigation Menu
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: Colors.white,
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
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
                    icon: Icons.photo_library,
                    label: 'Gallery',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GalleryScreen()),
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
                  NavButton(
                    icon: Icons.music_note,
                    label: 'Playlist',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PlaylistScreen()),
                    ),
                  ),
                  NavButton(
                    icon: Icons.table_chart,
                    label: 'Seating',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TableAssignmentsScreen()),
                    ),
                  ),
                  NavButton(
                    icon: Icons.timeline,
                    label: 'Timeline',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TimelineScreen()),
                    ),
                  ),
                  NavButton(
                    icon: Icons.book,
                    label: 'Guest Book',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GuestBookScreen()),
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
