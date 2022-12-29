import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sengped_flutter_profile/api_services.dart';
import 'package:sengped_flutter_profile/screens/main_menu.dart';

void main() {
  ApiServices().init();
  runApp(DevicePreview(
    isToolbarVisible: false,
    builder: (context) {
      return ResponsiveSizer(
        builder: (p0, p1, p2) {
          return const MyApp();
        },
      );
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: const MainMenu(),
    );
  }
}
