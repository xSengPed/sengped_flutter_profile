import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Work extends StatelessWidget {
  final bool reversed;
  final List<Widget> children;
  const Work({Key? key, this.reversed = false, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: reversed ? children.reversed.toList() : children));
  }
}
