import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final String title;
  const TopBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 120),
      padding: const EdgeInsets.all(16),
      color: const Color(0xFF04121F).withOpacity(0.25),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
