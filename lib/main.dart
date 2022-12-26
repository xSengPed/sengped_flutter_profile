import 'dart:ui';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:sengped_flutter_profile/components/nav_item.dart';

void main() {
  runApp(
      // const MyApp()
      DevicePreview(
    isToolbarVisible: false,
    builder: (context) {
      return const MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SafeArea(child: MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/abstract.png'))),
          child: Column(
            children: [
              Container(
                color: Colors.grey[800]?.withOpacity(0.25),
                height: 90,
                padding: const EdgeInsets.only(
                  top: 50,
                ),
                alignment: Alignment.topCenter,
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0.25, sigmaY: 0.25),
                    child: const Text('My Profile',
                        style: TextStyle(
                            color: Colors.white, fontSize: 1.6 * 10))),
              ),
              Flexible(
                  child: ListView(
                children: [
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Card(
                          margin: const EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          )),
                          child: Column(
                            children: [Text("lore")],
                          )),
                    ),
                  )
                ],
              )),
              Container(
                padding: const EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 80,
                color: Colors.white,
                child: Row(
                  children: const [
                    NavItems(
                      label: 'Skills',
                    ),
                    NavItems(
                      label: 'Project',
                    ),
                    NavItems(
                      label: 'Experience',
                    ),
                    NavItems(
                      label: 'Contact',
                    ),
                  ],
                ),
              ),
            ],
          )

          // Column(children: [
          //   Container(
          //     color: Colors.grey[800]?.withOpacity(0.25),
          //     height: 90,
          //     padding: const EdgeInsets.only(
          //       top: 50,
          //     ),
          //     alignment: Alignment.topCenter,
          //     child: BackdropFilter(
          //         filter: ImageFilter.blur(sigmaX: 0.25, sigmaY: 0.25),
          //         child: const Text('My Profile',
          //             style: TextStyle(color: Colors.white, fontSize: 1.6 * 10))),
          //   ),
          //   Container(
          //     padding: const EdgeInsets.only(top: 10),
          //     width: double.infinity,
          //     height: 80,
          //     color: Colors.white,
          //     child: Row(
          //       children: const [
          //         NavItems(
          //           label: 'Skills',
          //         ),
          //         NavItems(
          //           label: 'Project',
          //         ),
          //         NavItems(
          //           label: 'Experience',
          //         ),
          //         NavItems(
          //           label: 'Contact',
          //         ),
          //       ],
          //     ),
          //   )
          // ]),

          ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
