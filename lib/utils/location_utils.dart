import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class LocationUtils {
  static String generateMapsUrl(double latitude, double longitude) {
    if (Platform.isIOS) {
      return 'https://maps.apple.com/?ll=$latitude,$longitude';
    } else {
      return 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    }
  }

  static Future<void> openMaps(double latitude, double longitude) async {
    final url = generateMapsUrl(latitude, longitude);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch maps';
    }
  }
}
