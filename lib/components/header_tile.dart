import 'package:flutter/material.dart';
import 'package:sengped_flutter_profile/size_config.dart';

class HeaderTile extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  const HeaderTile({Key? key, this.leading, this.trailing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double defaultSize = SizeConfig.defaultSize;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.6 * defaultSize),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(width: 1.6 * defaultSize),
        leading ??
            Icon(
              Icons.home,
              size: 1.6 * defaultSize,
            ),
        SizedBox(width: 1.8 * defaultSize),
        Expanded(child: trailing ?? const Text('Live in Phuket , Thailand'))
      ]),
    );
  }
}
