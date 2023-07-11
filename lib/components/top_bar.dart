import 'package:flutter/material.dart';
import 'package:sengped_flutter_profile/components/general_dialog.dart';
import 'package:sengped_flutter_profile/screens/skills_page/skills_page.dart';

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
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
              const Spacer(),
              InkWell(
                onTap: () => Alert().showModal(context),
                child: const Icon(Icons.info_outline_rounded,
                    color: Colors.white, size: 28),
              )
            ],
          ),
        ],
      ),
    );
  }
}
