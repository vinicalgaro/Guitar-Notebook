import 'package:flutter/material.dart';

class DefaultHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const DefaultHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: 16.0, right: 16.0, top: 20.0, bottom: 10.0),
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            Text(subtitle, style: const TextStyle(fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
}
