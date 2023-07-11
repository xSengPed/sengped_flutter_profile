import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sengped_flutter_profile/components/my_navigation_bar.dart';
import 'package:sengped_flutter_profile/components/top_bar.dart';
import 'package:sengped_flutter_profile/screens/home/home.controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController ctrl = HomeController();

  @override
  void initState() {
    ctrl = HomeController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ctrl,
      child: Consumer<HomeController>(builder: (context, con, child) {
        return Scaffold(
          body: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: SvgPicture.asset(
                  'assets/images/layered-waves-haikei.svg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.transparent,
                child: Column(
                  children: [
                    TopBar(title: ctrl.pagesName[con.activeIndex]),
                    Flexible(
                      child: PageView(
                        controller: ctrl.pageController,
                        children: ctrl.pages,
                      ),
                    ),
                    MyNavigationBar(
                      controller: ctrl,
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
