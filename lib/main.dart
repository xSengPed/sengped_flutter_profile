import 'package:device_preview/device_preview.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:sengped_flutter_profile/providers/screen_provider.dart';
import 'package:sengped_flutter_profile/screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool enableDevicePreview = true;
  @override
  void initState() {
    super.initState();
    // SizeConfig().init(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.kanitTextTheme()),
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
            child: ResponsiveSizer(
              builder: (context, orientation, screen) {
                if (screen == ScreenType.mobile) {
                  return Center(child: Home());
                } else {
                  return Center(
                    child: DeviceFrame(
                      device: Devices.ios.iPhone13,
                      screen: Home(),
                      isFrameVisible: true,
                    ),
                  );
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
