import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:sengped_flutter_profile/components/glass_container.dart';

import 'package:sengped_flutter_profile/screens/skills_page/skills_page.controller.dart';
import 'package:sengped_flutter_profile/size_config.dart';

final double defaultSize = SizeConfig.defaultSize;

class SkillsPage extends StatefulWidget {
  const SkillsPage({Key? key}) : super(key: key);

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  late SkillsPageController ctrl;
  @override
  void initState() {
    ctrl = SkillsPageController();
    log('skill');
    super.initState();
  }

  @override
  void dispose() {
    // log('disp');
    super.dispose();
  }

  Widget renderImage(
    String imageSrc,
  ) {
    return imageSrc.contains('.svg')
        ? Center(
            child: SvgPicture.asset(
            imageSrc.toString(),
            width: 50,
          ))
        : Center(
            child: Image.asset(
              imageSrc.toString(),
              width: 50,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ctrl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Consumer<SkillsPageController>(
          builder: (context, con, child) {
            return SingleChildScrollView(
              child: GlassContainer(
                  child: DefaultTextStyle(
                style: GoogleFonts.kanit(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          children: const [
                            Text(
                              'Framework',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      MediaQuery.removePadding(
                        context: context,
                        removeBottom: true,
                        removeTop: true,
                        child: GridView.builder(
                          itemCount: con.frameworks.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: (context, index) {
                            return Tooltip(
                              triggerMode: TooltipTriggerMode.tap,
                              message: con.frameworks[index].name,
                              child: Card(
                                child: renderImage(
                                  con.frameworks[index].imgSrc!,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          children: const [
                            Text(
                              'Programing Languages',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      MediaQuery.removePadding(
                        context: context,
                        removeBottom: true,
                        removeTop: true,
                        child: GridView.builder(
                          itemCount: con.langs.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: (context, index) {
                            return Tooltip(
                              triggerMode: TooltipTriggerMode.tap,
                              message: con.langs[index].name.toString(),
                              child: Card(
                                child: Center(
                                  child: renderImage(
                                    con.langs[index].imgSrc!,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          children: const [
                            Text(
                              'Database',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      MediaQuery.removePadding(
                        context: context,
                        removeBottom: true,
                        removeTop: true,
                        child: GridView.builder(
                          itemCount: con.dbs.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: (context, index) {
                            return Tooltip(
                              triggerMode: TooltipTriggerMode.tap,
                              message: con.dbs[index].name,
                              child: Card(
                                child: Center(
                                  child: renderImage(
                                    con.dbs[index].imgSrc!,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            );
          },
        ),
      ),
    );
  }
}
