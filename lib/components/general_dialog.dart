import 'package:flutter/material.dart';
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
      shape: const RoundedRectangleBorder(
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
          Opacity(
            opacity: 0.7,
            child: Image.asset(
              'assets/images/plum-plate.png',
              fit: BoxFit.fill,
            ),
          ),
          Column(children: [
            Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Text('Contact Information',
                      style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 1.25,
                          color: Colors.white)),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close , color: Colors.white,)),
                ],
              ),
            ),
            Spacer(
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
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Image.asset('assets/images/phone-call.png', width: 25.w),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/icons/logo-linkedin.svg',
                            width: 24,
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          const Text("www.linkedin.com/in/donnukrit"),
                          const Spacer(),
                          InkWell(
                              onTap: () {},
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
