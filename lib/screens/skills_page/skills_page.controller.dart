import 'package:flutter/material.dart';
import 'package:sengped_flutter_profile/datasource.dart';
import 'package:sengped_flutter_profile/model/skill.dart';

class SkillsPageController extends ChangeNotifier {
  List<Skill> skills = [];

  List<Skill> get frameworks => skills
      .where(
        (item) => item.type == "framework",
      )
      .toList();
  List<Skill> get langs => skills
      .where(
        (item) => item.type == "lang",
      )
      .toList();
  List<Skill> get dbs => skills
      .where(
        (item) => item.type == "db",
      )
      .toList();
  SkillsPageController() {
    _initialize();
  }
  _initialize() async {
    skills = await DataSource().getSkills();
    notifyListeners();
  }
}
