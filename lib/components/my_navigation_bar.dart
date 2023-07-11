import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sengped_flutter_profile/screens/home/home.controller.dart';

class NavItem extends StatelessWidget {
  final Widget? icon;
  final String label;
  final Color? labelColor;
  final VoidCallback? onTap;
  const NavItem(
      {Key? key, this.icon, required this.label, this.labelColor, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap ??
            () {
              return;
            },
        child: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon ?? Container(),
              const SizedBox(
                height: 4,
              ),
              Text(
                label,
                style: TextStyle(color: labelColor ?? Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyNavigationBar extends StatelessWidget {
  final HomeController controller;
  const MyNavigationBar({Key? key, required this.controller}) : super(key: key);

  Color getActive(int currentPage, int index) {
    return currentPage == index ? const Color(0xFFd53867) : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 90,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: Consumer<HomeController>(builder: (context, con, child) {
          return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            NavItem(
              icon: SvgPicture.asset(
                'assets/images/icons/person-outline.svg',
                width: 2.4 * 10,
                color: getActive(con.currentPage, 0),
              ),
              onTap: () => con.changePage(0),
              label: 'Profile',
              labelColor: getActive(con.currentPage, 0),
            ),
            NavItem(
              icon: SvgPicture.asset(
                'assets/images/icons/code-slash-outline.svg',
                width: 2.4 * 10,
                color: getActive(con.currentPage, 1),
              ),
              onTap: () => con.changePage(1),
              label: 'Skills',
              labelColor: getActive(con.currentPage, 1),
            ),
            NavItem(
              icon: SvgPicture.asset(
                'assets/images/icons/newspaper-outline.svg',
                width: 2.4 * 10,
                color: getActive(con.currentPage, 2),
              ),
              onTap: () => controller.changePage(2),
              label: 'Education',
              labelColor: getActive(con.currentPage, 2),
            ),
            NavItem(
              icon: SvgPicture.asset(
                'assets/images/icons/briefcase-outline.svg',
                width: 2.4 * 10,
                color: getActive(con.currentPage, 3),
              ),
              onTap: () => controller.changePage(3),
              label: 'Experiences',
              labelColor: getActive(con.currentPage, 3),
            ),
          ]);
        }),
      ),
    );
  }
}
