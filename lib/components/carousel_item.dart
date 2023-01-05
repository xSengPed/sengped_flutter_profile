import 'package:flutter/material.dart';

import 'package:sengped_flutter_profile/size_config.dart';

class CarouselItem extends StatelessWidget {
  final Widget? child;
  const CarouselItem({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double defaultSize = SizeConfig.defaultSize;
    return Card(
      elevation: 0,
      child: Center(
        child: child ?? Container(),
      ),
    );
  }
}
