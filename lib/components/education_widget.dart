import 'package:flutter/material.dart';

import 'package:sengped_flutter_profile/screens/sections/experience.dart';

class EducationWidget extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  final Color? backgroundColor;

  const EducationWidget(
      {Key? key, this.leading, this.trailing, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1 * defaultSize),
      decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          leading ?? Container(),
          Expanded(child: trailing ?? Container())
        ],
      ),
    );
  }
}
