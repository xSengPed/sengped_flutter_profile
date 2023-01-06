import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sengped_flutter_profile/screens/sections/experience.dart';

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

class ContactUsModalSheet extends StatelessWidget {
  const ContactUsModalSheet({
    Key? key,
  }) : super(key: key);

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
                              onTap: () async {
                                await Clipboard.setData(const ClipboardData(
                                    text: "www.linkedin.com/in/donnukrit"));
                              },
                              child: const Icon(
                                Icons.copy,
                                size: 16,
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/icons/mail-open-outline.svg',
                            width: 24,
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          const Text("donnukrit.s@gmail.com"),
                          const Spacer(),
                          InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.copy,
                                size: 16,
                              ))
                        ],
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
