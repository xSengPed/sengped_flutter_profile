import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sengped_flutter_profile/components/general_dialog.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int currentPage = 0;

  Color? getActiveColor(index) {
    return currentPage == index ? Colors.blue : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(children: [
        Opacity(
          opacity: 0.9,
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/abstract.png'),
                    fit: BoxFit.cover)),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.grey[800]!.withOpacity(0.25),
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(left: 25, top: 30, right: 25),
                child: Row(
                  children: [
                    const Text(
                      "Donnukrit Satirakul",
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.25,
                          fontSize: 18),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Alert().showModal(context);
                      },
                      child: SvgPicture.asset(
                        'assets/images/icons/information-circle-outline.svg',
                        width: 24,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          // color: Colors.white.withOpacity(0.25),
          width: double.infinity,
          height: double.infinity,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 200,
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                child: Text('test'),
              )),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 85,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF252525).withOpacity(0.25),
                  blurRadius: 10.0,
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
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
                  setState(() {
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
                  setState(() {
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
                  setState(() {
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
                label: 'Experience',
                onChangeIndex: (index) {
                  setState(() {
                    currentPage = index;
                  });
                  log(index.toString());
                },
              ),
            ]),
          ),
        )
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
    return InkWell(
      onTap: () {
        widget.onChangeIndex(currentIndex);
      },
      child: Container(
        // duration: const Duration(milliseconds: 200),
        // color: Colors.transparent,
        width: 25.w,
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
                style: TextStyle(color: widget.activeColor ?? Colors.black87)),
            const Spacer(
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }
}
