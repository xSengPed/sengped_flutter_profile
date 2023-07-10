import 'dart:developer';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Alert {
  show(BuildContext context) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Title'),
              const Text('Desc'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'))
            ],
          ),
        );
      },
    );
  }

  showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return ContactUsModalSheet();
      },
    );
  }
}

class ContactUsModalSheet extends StatefulWidget {
  const ContactUsModalSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<ContactUsModalSheet> createState() => _ContactUsModalSheetState();
}

class _ContactUsModalSheetState extends State<ContactUsModalSheet> {
  bool disableCopy = false;

  double defaultSize = 10;
  void copyContent(BuildContext context, String content) async {
    if (!disableCopy) {
      setState(() {
        disableCopy = true;
      });
      await Clipboard.setData(ClipboardData(text: content));
      Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        message: "Content has been copied!",
        backgroundColor: Colors.green[700]!,
        borderRadius: BorderRadius.circular(50),
        messageSize: 1.2 * defaultSize,
        margin: EdgeInsets.symmetric(horizontal: 5 * defaultSize),
        duration: const Duration(milliseconds: 1500),
        icon: Icon(
          Icons.check_circle_outline_rounded,
          color: Colors.white,
          size: 1.6 * defaultSize,
        ),
        padding: EdgeInsets.all(1.2 * defaultSize),
      ).show(context);

      await Future.delayed(const Duration(milliseconds: 1500));
      setState(() {
        disableCopy = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: const Color(0xff001220),
          ),
          Column(children: [
            Container(
              height: 10 * defaultSize,
              padding: EdgeInsets.symmetric(horizontal: 2.5 * defaultSize),
              child: Row(
                children: [
                  Text('Contact Information',
                      style: TextStyle(
                          fontSize: 1.8 * defaultSize,
                          letterSpacing: 1.25,
                          color: Colors.white)),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Flexible(
              flex: 4,
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                margin: const EdgeInsets.all(0),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.5 * defaultSize),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.5 * defaultSize,
                      ),
                      Image.asset('assets/images/phone-call.png',
                          width: 4.8 * defaultSize),
                      SizedBox(
                        height: 2.5 * defaultSize,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/icons/logo-linkedin.svg',
                            width: 2.4 * defaultSize,
                          ),
                          SizedBox(
                            width: 2.5 * defaultSize,
                          ),
                          const Text("www.linkedin.com/in/donnukrit"),
                          const Spacer(),
                          InkWell(
                              onTap: () {
                                copyContent(
                                    context, "www.linkedin.com/in/donnukrit");
                              },
                              child: Icon(
                                Icons.copy,
                                size: 1.6 * defaultSize,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 2.5 * defaultSize,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/icons/logo-github.svg',
                            width: 2.4 * defaultSize,
                          ),
                          SizedBox(
                            width: 2.5 * defaultSize,
                          ),
                          const Text("https://github.com/KalimaPz"),
                          const Spacer(),
                          InkWell(
                              onTap: () {
                                copyContent(
                                    context, "https://github.com/KalimaPz");
                              },
                              child: Icon(
                                Icons.copy,
                                size: 1.6 * defaultSize,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 2.5 * defaultSize,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/icons/logo-medium.svg',
                            width: 2.4 * defaultSize,
                          ),
                          SizedBox(
                            width: 2.5 * defaultSize,
                          ),
                          const Text("https://donnukrit-s.medium.com/"),
                          const Spacer(),
                          InkWell(
                              onTap: () {
                                copyContent(
                                    context, "https://donnukrit-s.medium.com/");
                              },
                              child: Icon(
                                Icons.copy,
                                size: 1.6 * defaultSize,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 2.5 * defaultSize,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/icons/logo-discord.svg',
                            width: 2.4 * defaultSize,
                          ),
                          SizedBox(
                            width: 2.5 * defaultSize,
                          ),
                          const Text("zSengPedx#8235"),
                          const Spacer(),
                          InkWell(
                              onTap: () {
                                copyContent(context, "zSengPedx#8235");
                              },
                              child: Icon(
                                Icons.copy,
                                size: 1.6 * defaultSize,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 2.5 * defaultSize,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/icons/mail-open-outline.svg',
                            width: 2.4 * defaultSize,
                          ),
                          SizedBox(
                            width: 2.5 * defaultSize,
                          ),
                          const Text("donnukrit.s@gmail.com"),
                          const Spacer(),
                          InkWell(
                              onTap: () {
                                copyContent(context, "donnukrit.s@gmail.com");
                              },
                              child: Icon(
                                Icons.copy,
                                size: 1.6 * defaultSize,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 2.5 * defaultSize,
                      ),
                      const Spacer()
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
