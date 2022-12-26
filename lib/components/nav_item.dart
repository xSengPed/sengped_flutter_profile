import 'package:flutter/material.dart';

class NavItems extends StatefulWidget {
  final String label;
  const NavItems({Key? key, this.label = ""}) : super(key: key);

  @override
  State<NavItems> createState() => _NavItemsState();
}

class _NavItemsState extends State<NavItems> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Icon(Icons.person),
            Text(widget.label),
          ],
        ),
      ),
    );
  }
}
