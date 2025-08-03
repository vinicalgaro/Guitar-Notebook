import 'package:flutter/material.dart';

class DefaultDivider extends StatelessWidget {
  final double height;

  const DefaultDivider({super.key, this.height = 30.0});

  @override
  Widget build(BuildContext context) {
    return Divider(
        indent: 8.0,
        endIndent: 8.0,
        height: height,
        color: Theme.of(context).dividerColor.withOpacity(0.2));
  }
}
