// rsvp_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/guest.dart';
import '../providers/rsvp_provider.dart';

class RsvpScreen extends StatefulWidget {
  const RsvpScreen({super.key});

  @override
  _RsvpScreenState createState() => _RsvpScreenState();
}

class _RsvpScreenState extends State<RsvpScreen> {
  final _formKey = GlobalKey<FormState>();
  final String _name = '';
  final String _email = '';
  final int _numberOfGuests = 1;
  final bool _isAttending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RSVP'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Consumer<RsvpProvider>(
        builder: (context, rsvpProvider, child) {
          if (rsvpProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (rsvpProvider.error.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.red.shade100,
                      child: Text(
                        rsvpProvider.error,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  // Rest of the form remains the same
                  // ...

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _submitForm(rsvpProvider),
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
          );
        },
      ),
    );
  }

  void _submitForm(RsvpProvider rsvpProvider) async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      final guest = Guest(
        name: _name,
        email: _email,
        numberOfGuests: _numberOfGuests,
        isAttending: _isAttending,
      );

      final success = await rsvpProvider.submitRsvp(guest);

      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Thank you for your RSVP!'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context);
      }
    }
  }
}
