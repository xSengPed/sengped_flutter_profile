import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sengped_flutter_profile/components/carousel_item.dart';
import 'package:sengped_flutter_profile/components/header_tile.dart';
import 'package:sengped_flutter_profile/size_config.dart';

class Skills extends StatefulWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double defaultSize = SizeConfig.defaultSize;
    return Column(
      children: [
        Card(
          elevation: 0,
          child: HeaderTile(
            leading: Image.asset(
              'assets/images/icons/skills/ux.png',
              width: 2.4 * defaultSize,
            ),
            trailing: const Text('Front End Framework'),
          ),
        ),
        CarouselSlider(
            options: CarouselOptions(
                height: 15 * defaultSize,
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(seconds: 2)),
            items: [
              CarouselItem(
                child: Image.asset(
                  'assets/images/icons/skills/flutter.png',
                  width: 12.8 * defaultSize,
                ),
              ),
              CarouselItem(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Image.asset(
                    //   'assets/images/icons/skills/vue.svg',
                    //   width: 6.4 * defaultSize,
                    // ),
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
              ),
            ]),
        // Card(
        //   elevation: 0,
        //   child: HeaderTile(
        //     leading: Image.asset(
        //       'assets/images/icons/skills/agile.png',
        //       width: 2.4 * defaultSize,
        //     ),
        //     trailing: const Text('Bussiness Flow Management'),
        //   ),
        // ),
        // CarouselSlider(
        //   options: CarouselOptions(height: 15 * defaultSize),
        //   items: [
        //     CarouselItem(
        //       child: SizedBox(
        //           width: 10 * defaultSize,
        //           child: Image.asset('assets/images/icons/skills/jira.png')),
        //     ),
        //     CarouselItem(
        //       child: SizedBox(
        //           width: 16 * defaultSize,
        //           child:
        //               Image.asset('assets/images/icons/skills/confluence.png')),
        //     ),
        //     CarouselItem(
        //       child: SizedBox(
        //           width: 15 * defaultSize,
        //           child: Image.asset('assets/images/icons/skills/asana.png')),
        //     )
        //   ],
        // )
      ],
    );
  }
}
