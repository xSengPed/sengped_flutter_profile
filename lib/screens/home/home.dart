import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sengped_flutter_profile/screens/profile_page/profile_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SvgPicture.asset(
              'assets/images/layered-waves-haikei.svg',
              fit: BoxFit.cover,
            ),
          ),
          PageView(
            children: const [
              ProfilePage(),
            ],
          ),
        ],
      ),
    );
  }
}
