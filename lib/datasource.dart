import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:sengped_flutter_profile/model/profile.dart';
import 'package:sengped_flutter_profile/model/skill.dart';

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

  Future<List<Skill>> getSkills() async {
    try {
      final String response =
          await rootBundle.loadString('assets/json/skills.json');
      final List<Skill> result = List.generate(
          jsonDecode(response)['data'].length,
          (index) => Skill.fromJson(jsonDecode(response)['data'][index]));
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
