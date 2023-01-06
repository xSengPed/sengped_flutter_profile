import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sengped_flutter_profile/components/award.dart';
import 'package:sengped_flutter_profile/size_config.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double defaultSize = SizeConfig.defaultSize;
    return Column(
      children: [
        Container(
          width: 17.5 * defaultSize,
          height: 17.5 * defaultSize,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(500),
              border:
                  Border.all(color: Colors.white, width: 0.5 * defaultSize)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(500),
            child: Image.network(
                'https://avatars.githubusercontent.com/u/23716821?v=4',
                fit: BoxFit.cover),
          ),
        ),
        SizedBox(
          height: 1.6 * defaultSize,
        ),
        Text(
          'Donnukrit Satirakul',
          style: TextStyle(fontSize: 1.8 * defaultSize, color: Colors.white),
        ),
        SizedBox(
          height: 1.0 * defaultSize,
        ),
        Text(
          'Front End Developer',
          style: TextStyle(fontSize: 1.2 * defaultSize, color: Colors.white),
        ),
        SizedBox(
          height: 1.6 * defaultSize,
        ),
        Card(
          child: Column(children: [
            Container(
                padding: EdgeInsets.only(
                    top: 1.6 * defaultSize, left: 1.6 * defaultSize),
                alignment: Alignment.centerLeft,
                child: Text(
                  'General',
                  style: TextStyle(
                      fontSize: 1.4 * defaultSize,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.25),
                )),
            PersonalInfoTile(
                leading: SvgPicture.asset(
                  'assets/images/icons/business-outline.svg',
                  width: 1.8 * defaultSize,
                ),
                trailing: Text(
                  'Exvention Co. Ltd, Bangkok',
                  style: TextStyle(fontSize: 1.2 * defaultSize),
                )),
            PersonalInfoTile(
              leading: SvgPicture.asset(
                'assets/images/icons/navigate-outline.svg',
                width: 1.8 * defaultSize,
              ),
              trailing: Text(
                'Live in Kathu , Phuket',
                style: TextStyle(fontSize: 1.2 * defaultSize),
              ),
            ),
          ]),
        ),
        Card(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 1.6 * defaultSize),
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(
                      top: 1.6 * defaultSize,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'About',
                      style: TextStyle(
                          fontSize: 1.4 * defaultSize,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.25),
                    )),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        """
Currently im working as mobile developer with Exvention.\nUse Flutter for mobile application development.My project associates with Krung Thai Bank (GLO Lotto : Digital Lottery).
I have an experience in mobile applications development for 3 years.\nI'm able to use front end web applications framework such as Vue and React.
""",
                        style: TextStyle(fontSize: 1.2 * defaultSize),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Card(
          child: Column(children: [
            PersonalInfoTile(
              leading: SvgPicture.asset(
                'assets/images/icons/trophy-outline.svg',
                width: 1.8 * defaultSize,
              ),
              trailing: Text(
                "Honors & awards",
                style: TextStyle(
                    fontSize: 1.4 * defaultSize,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.25),
              ),
            ),
            const Award(
              title: "The Nineteenth Thailand IT Contest Festival 2020",
              issueBy: "Issued by NECTEC · Mar 2020",
              desc:
                  "Got a scholarship funded project developer voice assistant robot.At National Software Contest 21 (NSC'21)",
            ),
            const Award(
              title: "National Software Contest : Southern Region",
              issueBy:
                  "Issued by Department of Computer Engineering, Faculty of Engineering, Prince of Songkhla University Hat Yai Campus · Feb 2020",
              desc:
                  "Assiociate with Prince of Songkhla University Phuket Campus as Competitor",
            ),
          ]),
        ),
      ],
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
    SizeConfig().init(context);
    final double defaultSize = SizeConfig.defaultSize;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.6 * defaultSize),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(width: 1.6 * defaultSize),
        leading ??
            Icon(
              Icons.home,
              size: 1.6 * defaultSize,
            ),
        SizedBox(width: 1.8 * defaultSize),
        Expanded(child: trailing ?? const Text('Live in Phuket , Thailand'))
      ]),
    );
  }
}
