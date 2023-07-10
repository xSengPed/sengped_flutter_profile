// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';
import 'package:sengped_flutter_profile/components/award.dart';

import 'package:sengped_flutter_profile/components/glass_container.dart';
import 'package:sengped_flutter_profile/screens/profile_page/profile_page.controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfilePageController ctrl;

  @override
  void initState() {
    // TODO: implement initState
    ctrl = ProfilePageController();
    super.initState();
  }

  double defaultSize = 10.0;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ctrl,
      child: Consumer<ProfilePageController>(builder: (context, con, child) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: con.isLoading
                ? Container()
                : Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Container(
                              width: 17.5 * defaultSize,
                              height: 17.5 * defaultSize,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(500),
                                  border: Border.all(
                                      color: Colors.white,
                                      width: 0.5 * defaultSize)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(500),
                                child: Image.network(
                                    ctrl.profile.avatarUrl.toString(),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(
                              height: 1.6 * defaultSize,
                            ),
                            Text(
                              '${con.profile.name}',
                              style: TextStyle(
                                  fontSize: 1.8 * defaultSize,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 1.0 * defaultSize,
                            ),
                            Text(
                              '${con.profile.jobTitle}',
                              style: TextStyle(
                                  fontSize: 1.2 * defaultSize,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 1.6 * defaultSize,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: GlassContainer(
                                child: DefaultTextStyle(
                                  style: const TextStyle(
                                      color: Colors.white, fontFamily: 'kanit'),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/icons/business-outline.svg',
                                                width: 24,
                                                color: Colors.white),
                                            SizedBox(
                                              width: 16,
                                            ),
                                            Text(con.profile.workInfo
                                                .toString()),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16.0),
                                          child: Row(
                                            children: [
                                              Text('Introduction'),
                                            ],
                                          ),
                                        ),
                                        Text(con.profile.introduction
                                            .toString()),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16.0),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/images/icons/trophy-outline.svg',
                                                  width: 24,
                                                  color: Colors.white),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Text('Hornor & Awards'),
                                            ],
                                          ),
                                        ),
                                        MediaQuery.removePadding(
                                            removeTop: true,
                                            removeBottom: true,
                                            context: context,
                                            child: ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount:
                                                  con.profile.awards?.length ??
                                                      0,
                                              itemBuilder: (context, index) {
                                                return Award(
                                                  title: con.profile
                                                      .awards![index].title
                                                      .toString(),
                                                  issueBy: con.profile
                                                      .awards![index].issueBy
                                                      .toString(),
                                                  desc: con.profile
                                                      .awards![index].desc
                                                      .toString(),
                                                );
                                              },
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        );
      }),
    );
  }
}
