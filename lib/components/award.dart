import 'package:flutter/material.dart';
import 'package:sengped_flutter_profile/size_config.dart';

class Award extends StatelessWidget {
  final String title;
  final String issueBy;
  final String desc;
  const Award({Key? key, this.title = "", this.issueBy = "", this.desc = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double defaultSize = SizeConfig.defaultSize;
    return Container(
      padding: EdgeInsets.only(
          left: 2.0 * defaultSize,
          right: 2.0 * defaultSize,
          bottom: 1 * defaultSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 1.4 * defaultSize),
          ),
          Text(
            issueBy,
            style: TextStyle(fontSize: 1.0 * defaultSize),
          ),
          SizedBox(
            height: 1.2 * defaultSize,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  desc,
                  style: TextStyle(fontSize: 1.2 * defaultSize),
                ),
              )
            ],
          ),
          Row(
            children: const [Expanded(child: Divider())],
          )
        ],
      ),
    );
  }
}
