import 'package:device_preview/device_preview.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

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
    return ResponsiveSizer(
      builder: (BuildContext context, Orientation orientation,
          ScreenType screenType) {
        return MaterialApp(
          theme: ThemeData(textTheme: GoogleFonts.kanitTextTheme()),
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.stylus,
              PointerDeviceKind.unknown
            },
          ),
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          home: enableDevicePreview
              ? DevicePreview(
                  isToolbarVisible: false,
                  enabled: screenType != ScreenType.mobile,
                  builder: (context) {
                    return const Home();
                  },
                )
              : const Home(),
        );
      },
    );
  }
}
