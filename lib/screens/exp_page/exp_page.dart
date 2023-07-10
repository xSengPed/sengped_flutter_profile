import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sengped_flutter_profile/asset.dart';
import 'package:sengped_flutter_profile/components/header_tile.dart';
import 'package:sengped_flutter_profile/model/workplace.dart';
import 'package:sengped_flutter_profile/providers/screen_provider.dart';
import 'package:timelines/timelines.dart';

class ExpPage extends StatefulWidget {
  const ExpPage({Key? key}) : super(key: key);

  @override
  State<ExpPage> createState() => _ExpPageState();
}

class _ExpPageState extends State<ExpPage> {
  List<Workplace> workplaces = [
    Workplace(
      company: "Weserve Co. Ltd.",
      position: "Internship",
      location: "Phuket , Thailand",
      start: "May",
      end: "July 2020",
      logo: Assets.weserve,
      desc: "- Servesook Smart Farm App associate with Servesook",
    ),
    Workplace(
        company: "Weserve Co. Ltd.",
        position: "Front End Developer",
        location: "Phuket , Thailand",
        start: "Aug",
        end: "Dec 2020",
        logo: Assets.weserve,
        desc: "- Artisgo Merchant associate with Artisgo"),
    Workplace(
        company: "Alicorn Co. Ltd",
        position: "Mobile Application Developer",
        location: "Phuket , Thailand",
        start: "Jan",
        end: "Sep 2021",
        logo: Assets.alicorn,
        desc: "- Noochuap Delivery associate with Alicorn"),
    Workplace(
        company: "Freelance",
        position: "Front End Developer",
        location: "Phuket , Thailand",
        start: "Oct 2021",
        end: "Oct 2022",
        logo: null),
    Workplace(
        company: "Exvention Co. Ltd",
        position: "Mobile Application Developer",
        location: "Bangkok , Thailand",
        start: "Nov 2022",
        end: "Current",
        logo: Assets.exvention,
        desc: "- GLO Digital Lottery associate with Krungthai Bank"),
  ];

  double defaultSize = 10;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                itemCount: workplaces.length,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (workplaces[index].logo != null)
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.asset(
                                              workplaces[index].logo ?? "",
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
                                        Text(workplaces[index].company ?? "",
                                            style: TextStyle(
                                                fontSize: 1.4 * defaultSize,
                                                fontWeight: FontWeight.w600)),
                                        Text(workplaces[index].position ?? "",
                                            style: TextStyle(
                                                fontSize: 1.2 * defaultSize)),
                                        Text(
                                            "${workplaces[index].start} - ${workplaces[index].end}",
                                            style: TextStyle(
                                                fontSize: 1.2 * defaultSize)),
                                        Text(workplaces[index].location ?? "",
                                            style: TextStyle(
                                                fontSize: 1.2 * defaultSize)),
                                        if (workplaces[index].desc != null)
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 1.6 * defaultSize),
                                            alignment: Alignment.centerLeft,
                                            child: Text("Projects",
                                                style: TextStyle(
                                                    fontSize: 1.2 * defaultSize,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ),
                                        Text(workplaces[index].desc ?? "",
                                            style: TextStyle(
                                                fontSize: 1.2 * defaultSize)),
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
                startConnectorBuilder: (context, index) => Connector.solidLine(
                  color: Colors.white,
                ),
                endConnectorBuilder: (context, index) {
                  if (workplaces[index].end!.toUpperCase() == "CURRENT") {
                    return Connector.dashedLine(color: Colors.white);
                  } else {
                    return Connector.solidLine(color: Colors.white);
                  }
                },
              )),
          Consumer<ScreenProvider>(
            builder: (context, ScreenProvider screenProvider, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedOpacity(
                  opacity: screenProvider.isScrollFinish ? 1.0 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: SizedBox(
                    height: 4.5 * defaultSize,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: const Color(0xFF001220),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: const Text('View Another Projects'),
                        onPressed: () {}),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
