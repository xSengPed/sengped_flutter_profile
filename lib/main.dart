import 'package:device_preview/device_preview.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sengped_flutter_profile/api_services.dart';
import 'package:sengped_flutter_profile/providers/screen_provider.dart';
import 'package:sengped_flutter_profile/screens/home/home.dart';
import 'package:sengped_flutter_profile/screens/main_menu.dart';
import 'package:sengped_flutter_profile/screens/profile_page/profile_page.dart';

void main() {
  ApiServices().init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // SizeConfig().init(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ScreenProvider(),
          )
        ],
        child: Stack(children: [
          MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => ScreenProvider(),
              )
            ],
            child: DevicePreview(
              builder: (context) {
                return const Home();
              },
            ),
          ),
        ]),
      ),
    );
  }
}
