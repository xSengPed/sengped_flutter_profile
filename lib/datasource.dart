import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sengped_flutter_profile/model/profile.dart';

class DataSource {
  Future<Profile> getProfile() async {
    try {
      final String response =
          await rootBundle.loadString('assets/json/profile.json');
      return Profile.fromJson(jsonDecode(response));
    } catch (e) {
      rethrow;
    }
  }
}
