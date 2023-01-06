import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:sengped_flutter_profile/components/general_dialog.dart';
import 'package:sengped_flutter_profile/providers/screen_provider.dart';
import 'package:sengped_flutter_profile/screens/sections/education.dart';
import 'package:sengped_flutter_profile/screens/sections/experience.dart';
import 'package:sengped_flutter_profile/screens/sections/profile.dart';
import 'package:sengped_flutter_profile/screens/sections/skills.dart';
import 'package:sengped_flutter_profile/size_config.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  late ScreenProvider screenProvider;
  Color appbarTextColor = Colors.white;
  late Color appbarColor;
  bool isFinish = false;
  late final ScrollController _scrollController = ScrollController();
  List<Widget> sections = [
    const Profile(),
    const Skills(),
    const Education(),
    const Experience(),
  ];
  int currentPage = 0;

  Color? getActiveColor(index) {
    return currentPage == index ? const Color(0xFFd53867) : null;
  }

  @override
  void initState() {
    super.initState();
    screenProvider = Provider.of<ScreenProvider>(context, listen: false);

    appbarColor = Colors.transparent;

    _scrollController.addListener(() {
      screenProvider.setScrollPosition(_scrollController.position.pixels);

      if (_scrollController.position.pixels == 0) {
        log('start');
        setState(() {
          appbarTextColor = Colors.white;
          appbarColor = Colors.transparent;
          isFinish = false;
          screenProvider.setScrollFinish(false);
        });
      } else if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        log('end');
        screenProvider.setScrollFinish(true);
      } else if (_scrollController.position.pixels > 0) {
        setState(() {
          appbarTextColor = Colors.grey[800]!;
          appbarColor = Colors.white;
          isFinish = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double defaultSize = SizeConfig.defaultSize;
    return Scaffold(
        appBar: null,
        backgroundColor: Colors.grey[100],
        body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: SvgPicture.asset(
                  'assets/images/layered-waves-haikei.svg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 120),
                child: Column(
                  children: [
                    Flexible(
                        child: MediaQuery.removePadding(
                            removeTop: true,
                            context: context,
                            child: ListView(
                              shrinkWrap: true,
                              controller: _scrollController,
                              children: [sections[currentPage]],
                              // color: Colors.blue,
                            ))),
                    const SizedBox(
                      height: 85,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: _navigationBar(context),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                decoration: BoxDecoration(color: appbarColor, boxShadow: [
                  if (isFinish)
                    BoxShadow(
                      color: const Color(0xFF252525).withOpacity(0.25),
                      offset: const Offset(1, -2),
                      spreadRadius: 0.5,
                      blurRadius: 10.0,
                    ),
                ]),
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(children: [
                    Consumer<ScreenProvider>(
                        builder: (context, ScreenProvider provider, child) {
                      return Expanded(
                          child: Text(
                        provider.screenName,
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 1.25,
                          fontWeight: FontWeight.w200,
                          color: appbarTextColor,
                        ),
                      ));
                    }),
                    InkWell(
                      onTap: () => Alert().showModal(context),
                      child: SvgPicture.asset(
                        'assets/images/icons/information-circle-outline.svg',
                        color: appbarTextColor,
                        width: 2.8 * defaultSize,
                      ),
                    )
                  ]),
                ),
              ),
            ])));
  }

  Container _navigationBar(BuildContext context) {
    return Container(
      height: 85,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF252525).withOpacity(0.25),
            blurRadius: 10.0,
          )
        ],
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
      ),
      child: Row(children: [
        NavigatorIcon(
          0,
          activeColor: getActiveColor(0),
          icon: SvgPicture.asset(
            'assets/images/icons/person-outline.svg',
            width: 24,
            color: getActiveColor(0),
          ),
          label: 'Profile',
          onChangeIndex: (index) {
            screenProvider.setScreenName("Profile");
            setState(() {
              appbarColor = Colors.transparent;
              appbarTextColor = Colors.white;
              currentPage = index;
            });
            log(index.toString());
          },
        ),
        NavigatorIcon(
          1,
          activeColor: getActiveColor(1),
          icon: SvgPicture.asset(
            'assets/images/icons/code-slash-outline.svg',
            width: 24,
            color: getActiveColor(1),
          ),
          label: 'Skills',
          onChangeIndex: (index) {
            screenProvider.setScreenName("Skills");
            setState(() {
              appbarColor = Colors.transparent;
              appbarTextColor = Colors.white;
              currentPage = index;
            });
            log(index.toString());
          },
        ),
        NavigatorIcon(
          2,
          activeColor: getActiveColor(2),
          icon: SvgPicture.asset(
            'assets/images/icons/newspaper-outline.svg',
            width: 24,
            color: getActiveColor(2),
          ),
          label: 'Education',
          onChangeIndex: (index) {
            screenProvider.setScreenName("Education");
            setState(() {
              appbarColor = Colors.transparent;
              appbarTextColor = Colors.white;
              currentPage = index;
            });
            log(index.toString());
          },
        ),
        NavigatorIcon(
          3,
          activeColor: getActiveColor(3),
          icon: SvgPicture.asset(
            'assets/images/icons/briefcase-outline.svg',
            color: getActiveColor(3),
            width: 24,
          ),
          label: 'Experiences',
          onChangeIndex: (index) {
            screenProvider.setScreenName("Experiences");
            setState(() {
              appbarColor = Colors.transparent;
              appbarTextColor = Colors.white;
              currentPage = index;
            });
            log(index.toString());
          },
        ),
      ]),
    );
  }
}

class NavigatorIcon extends StatefulWidget {
  final int index;
  final Color? activeColor;
  final String label;
  final Widget? icon;
  final Function(int) onChangeIndex;

  const NavigatorIcon(
    this.index, {
    this.activeColor,
    this.label = "",
    this.icon,
    required this.onChangeIndex,
    Key? key,
  }) : super(key: key);

  @override
  State<NavigatorIcon> createState() => _NavigatorIconState();
}

class _NavigatorIconState extends State<NavigatorIcon> {
  late int currentIndex;
  bool isActive = false;
  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;

    if (widget.activeColor == null) {
      setState(() {
        isActive = false;
      });
    } else {
      setState(() {
        isActive = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          widget.onChangeIndex(currentIndex);
        },
        child: Container(
          // duration: const Duration(milliseconds: 200),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(
                flex: 4,
              ),
              widget.icon ??
                  const Text(
                    "",
                  ),
              const Spacer(
                flex: 2,
              ),
              Text(widget.label,
                  style:
                      TextStyle(color: widget.activeColor ?? Colors.black87)),
              const Spacer(
                flex: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
