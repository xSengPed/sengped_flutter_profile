import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      child: Column(children: [
        Container(
          height: (100.h - 85),
          child: Stack(children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: AssetImage('assets/images/abstract.png'),
                      opacity: 0.7,
                      fit: BoxFit.cover)),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 45.w,
                    height: 45.w,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(
                              'assets/images/plum-plate.png',
                            ),
                            fit: BoxFit.cover),
                        border: Border.all(
                          width: 5,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(200)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Donnukrit Satirakul',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  const Text(
                    'Front End Developer',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const Text(
                    '(Exvention Co. Ltd)',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ]),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          child: Column(
            children: [
              PersonalInfoTile(
                leading: Icon(Icons.location_on),
              ),
              PersonalInfoTile(
                leading: Icon(Icons.business_center),
                trailing: Text(
                    'Phra Khanong Nuea, Watthana District, Bangkok , Thailand'),
              ),
              const SizedBox(
                height: 85,
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class PersonalInfoTile extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  const PersonalInfoTile({Key? key, this.leading, this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        leading ?? Icon(Icons.home),
        SizedBox(width: 16),
        Expanded(child: trailing ?? Text('Live in Phuket , Thailand'))
      ]),
    );
  }
}
