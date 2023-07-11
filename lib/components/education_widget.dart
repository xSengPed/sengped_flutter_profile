import 'package:flutter/material.dart';

class EducationWidget extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  final Color? backgroundColor;

  const EducationWidget(
      {Key? key, this.leading, this.trailing, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = 10;
    return Container(
      constraints: BoxConstraints(minHeight: 15 * defaultSize),
      padding: EdgeInsets.all(1 * defaultSize),
      decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          leading ?? Container(),
          Expanded(child: trailing ?? Container())
        ],
      ),
    );
  }
}
