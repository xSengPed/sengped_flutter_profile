import 'package:flutter/material.dart';
import 'package:sengped_flutter_profile/datasource.dart';
import 'package:sengped_flutter_profile/model/profile.dart';

class ProfilePageController extends ChangeNotifier {
  late Profile profile;
  bool isLoading = false;

  ProfilePageController() {
    _initialize();
  }

  _initialize() async {
    isLoading = true;
    profile = await DataSource().getProfile();
    isLoading = false;
    notifyListeners();
  }
}
