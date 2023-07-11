import 'package:flutter/material.dart';
import 'package:sengped_flutter_profile/asset.dart';
import 'package:sengped_flutter_profile/model/workplace.dart';

class ExpPageController extends ChangeNotifier {
  BuildContext context;
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

  ExpPageController(this.context);
}
