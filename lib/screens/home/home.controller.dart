import 'package:flutter/material.dart';
import 'package:sengped_flutter_profile/screens/edu_page/edu_page.dart';
import 'package:sengped_flutter_profile/screens/exp_page/exp_page.dart';
import 'package:sengped_flutter_profile/screens/profile_page/profile_page.dart';
import 'package:sengped_flutter_profile/screens/skills_page/skills_page.dart';

class HomeController extends ChangeNotifier {
  BuildContext context;

  List<String> pagesName = const [
    "Profile",
    "Skills",
    "Education",
    "Experiences"
  ];
  List<Widget> pages = const [
    ProfilePage(),
    SkillsPage(),
    EduPage(),
    ExpPage()
  ];
  PageController pageController = PageController(initialPage: 0);
  ScrollController scrollController = ScrollController();

  int activeIndex = 0;
  HomeController(this.context) {
    pageController.addListener(() {
      notifyListeners();
    });
  }

  int get currentPage => pageController.page?.toInt() ?? 0;

  void changePage(int pageNumber) {
    if (pageNumber > (pages.length - 1)) {
      return;
    } else {
      pageController.animateToPage(pageNumber,
          curve: Curves.linear, duration: const Duration(milliseconds: 400));
      notifyListeners();
    }
  }
}
