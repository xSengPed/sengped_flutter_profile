import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sengped_flutter_profile/components/header_tile.dart';

import 'package:sengped_flutter_profile/screens/exp_page/exp_page.controller.dart';
import 'package:timelines/timelines.dart';

class ExpPage extends StatefulWidget {
  const ExpPage({Key? key}) : super(key: key);

  @override
  State<ExpPage> createState() => _ExpPageState();
}

class _ExpPageState extends State<ExpPage> {
  late ExpPageController ctrl;

  @override
  void initState() {
    ctrl = ExpPageController(context);
    super.initState();
  }

  double defaultSize = 10;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ctrl,
      child: Consumer<ExpPageController>(builder: (context, con, child) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                HeaderTile(
                  leading: Icon(
                    Icons.business_center_outlined,
                    color: Colors.white,
                    size: 2.4 * defaultSize,
                  ),
                  trailing: Text(
                    'Working Experience',
                    style: TextStyle(
                        fontSize: 1.8 * defaultSize,
                        letterSpacing: 1.25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                Timeline.tileBuilder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    primary: true,
                    builder: TimelineTileBuilder(
                      contentsAlign: ContentsAlign.alternating,
                      itemCount: con.workplaces.length,
                      contentsBuilder: (context, index) {
                        return Row(
                          children: [
                            Expanded(
                              child: Card(
                                child: Container(
                                    padding: EdgeInsets.all(1.2 * defaultSize),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            if (con.workplaces[index].logo !=
                                                null)
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Image.asset(
                                                    con.workplaces[index]
                                                            .logo ??
                                                        "",
                                                    width: 4.8 * defaultSize),
                                              ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1.6 * defaultSize,
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                  con.workplaces[index]
                                                          .company ??
                                                      "",
                                                  style: TextStyle(
                                                      fontSize:
                                                          1.4 * defaultSize,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Text(
                                                  con.workplaces[index]
                                                          .position ??
                                                      "",
                                                  style: TextStyle(
                                                      fontSize:
                                                          1.2 * defaultSize)),
                                              Text(
                                                  "${con.workplaces[index].start} - ${con.workplaces[index].end}",
                                                  style: TextStyle(
                                                      fontSize:
                                                          1.2 * defaultSize)),
                                              Text(
                                                  con.workplaces[index]
                                                          .location ??
                                                      "",
                                                  style: TextStyle(
                                                      fontSize:
                                                          1.2 * defaultSize)),
                                              if (con.workplaces[index].desc !=
                                                  null)
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      top: 1.6 * defaultSize),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text("Projects",
                                                      style: TextStyle(
                                                          fontSize:
                                                              1.2 * defaultSize,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                              Text(
                                                  con.workplaces[index].desc ??
                                                      "",
                                                  style: TextStyle(
                                                      fontSize:
                                                          1.2 * defaultSize)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ],
                        );
                      },
                      indicatorBuilder: (context, index) =>
                          Indicator.outlined(color: Colors.white),
                      startConnectorBuilder: (context, index) =>
                          Connector.solidLine(
                        color: Colors.white,
                      ),
                      endConnectorBuilder: (context, index) {
                        if (con.workplaces[index].end!.toUpperCase() ==
                            "CURRENT") {
                          return Connector.dashedLine(color: Colors.white);
                        } else {
                          return Connector.solidLine(color: Colors.white);
                        }
                      },
                    )),
              ],
            ),
          ),
        );
      }),
    );
  }
}
