import 'package:flutter/material.dart';
import 'package:sengped_flutter_profile/components/education_widget.dart';
import 'package:sengped_flutter_profile/components/header_tile.dart';

class EduPage extends StatefulWidget {
  const EduPage({Key? key}) : super(key: key);

  @override
  State<EduPage> createState() => _EduPageState();
}

class _EduPageState extends State<EduPage> {
  double defaultSize = 10;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          HeaderTile(
            leading: Image.asset(
              'assets/images/icons/clock.png',
              width: 2.8 * defaultSize,
            ),
            trailing: Text(
              "History",
              style:
                  TextStyle(fontSize: 1.8 * defaultSize, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 1.6 * defaultSize,
          ),
          EducationWidget(
            leading: Image.asset(
              'assets/images/icons/graduation-hat.png',
              width: 6.4 * defaultSize,
            ),
            trailing: Column(children: [
              Text(
                'Prince of Songkhla University',
                style: TextStyle(
                    fontSize: 1.4 * defaultSize,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.25),
                textAlign: TextAlign.center,
              ),
              Text('Phuket , Thailand',
                  style: TextStyle(fontSize: 1.2 * defaultSize)),
              Text('2016 - 2020',
                  style: TextStyle(fontSize: 1.2 * defaultSize)),
              Text('(B.Eng)', style: TextStyle(fontSize: 1.2 * defaultSize)),
              Text('(Computer Engineering : Information Engineering)',
                  style: TextStyle(fontSize: 1.2 * defaultSize)),
              Text('(GPA : 2.64)',
                  style: TextStyle(fontSize: 1.2 * defaultSize)),
            ]),
          ),
          SizedBox(
            height: 1.6 * defaultSize,
          ),
          EducationWidget(
            leading: Image.asset(
              'assets/images/icons/school.png',
              width: 6.4 * defaultSize,
            ),
            trailing: Column(children: [
              Text(
                'Pakphanang School',
                style: TextStyle(
                    fontSize: 1.4 * defaultSize,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.25),
                textAlign: TextAlign.center,
              ),
              Text('Nakorn Sri Thammarat , Thailand',
                  style: TextStyle(fontSize: 1.2 * defaultSize)),
              Text('2010- 2016', style: TextStyle(fontSize: 1.2 * defaultSize)),
              Text('(Sci-Math Program)',
                  style: TextStyle(fontSize: 1.2 * defaultSize)),
            ]),
          ),
        ],
      ),
    );
  }
}
