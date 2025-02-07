import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/guest.dart';

class RsvpProvider with ChangeNotifier {
  bool _isLoading = false;
  String _error = '';

  bool get isLoading => _isLoading;
  String get error => _error;

  Future<bool> submitRsvp(Guest guest) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      // Replace with your actual API endpoint
      final response = await http.post(
        Uri.parse('https://your-api.com/rsvp'),
        body: json.encode(guest.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      _isLoading = false;
      if (response.statusCode == 200) {
        notifyListeners();
        return true;
      } else {
        _error = 'Failed to submit RSVP';
        notifyListeners();
        return false;
      }
    } catch (e) {
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }
}
