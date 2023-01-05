import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sengped_flutter_profile/components/carousel_item.dart';
import 'package:sengped_flutter_profile/components/header_tile.dart';
import 'package:sengped_flutter_profile/size_config.dart';

final double defaultSize = SizeConfig.defaultSize;

class Skills extends StatefulWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  final CarouselController _controller = CarouselController();
  int currentItemIndex = 0;
  List<CarouselItem> items = [
    CarouselItem(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/icons/skills/vue.svg',
            width: 6.4 * defaultSize,
          ),
          SizedBox(
            width: 1.6 * defaultSize,
          ),
          Text(
            'Vue',
            style: TextStyle(fontSize: 2.4 * defaultSize),
          )
        ],
      ),
    ),
    CarouselItem(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/icons/skills/nuxt.png',
            width: 6.4 * defaultSize,
          ),
          SizedBox(
            width: 1.6 * defaultSize,
          ),
          Text(
            'Nuxt',
            style: TextStyle(fontSize: 2.4 * defaultSize),
          )
        ],
      ),
    ),
    CarouselItem(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/icons/skills/react.png',
            width: 6.4 * defaultSize,
          ),
          SizedBox(
            width: 1.6 * defaultSize,
          ),
          Text(
            'React',
            style: TextStyle(fontSize: 2.4 * defaultSize),
          )
        ],
      ),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0,
          child: HeaderTile(
            leading: Image.asset(
              'assets/images/icons/skills/ux.png',
              width: 2.4 * defaultSize,
            ),
            trailing: const Text('About My Skills'),
          ),
        ),
        Card(
          child: Padding(
            padding: EdgeInsets.all(1.6 * defaultSize),
            child: Column(children: [
              Row(
                children: const [
                  Expanded(
                    child: Text(
                        "With 3 years of experience in Flutter mobile development, making me proficient in the use of the Flutter framework and mobile development best practices"),
                  )
                ],
              ),
            ]),
          ),
        ),
        Card(
          elevation: 0,
          child: HeaderTile(
            leading: Image.asset(
              'assets/images/icons/skills/ux.png',
              width: 2.4 * defaultSize,
            ),
            trailing: const Text('Main'),
          ),
        ),
        SizedBox(
          height: 15 * defaultSize,
          child: CarouselItem(
            child: Image.asset(
              'assets/images/icons/skills/flutter.png',
              width: 12.8 * defaultSize,
            ),
          ),
        ),
        Card(
          elevation: 0,
          child: HeaderTile(
            leading: Image.asset(
              'assets/images/icons/skills/ux.png',
              width: 2.4 * defaultSize,
            ),
            trailing: const Text('Other Skills'),
          ),
        ),
        CarouselSlider.builder(
            carouselController: _controller,
            itemCount: items.length,
            itemBuilder: (context, index, _) => items[index],
            options: CarouselOptions(
              onPageChanged: (index, _) {
                log(index.toString());
                setState(() {
                  currentItemIndex = index;
                });
              },
              height: 15 * defaultSize,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(seconds: 2),
            )),
        DotsIndicator(
          decorator: const DotsDecorator(
            color: Colors.grey,
            activeColor: Colors.red,
          ),
          dotsCount: items.length,
          position: currentItemIndex.toDouble(),
        )
      ],
    );
  }
}
