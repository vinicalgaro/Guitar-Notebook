import 'package:flutter/material.dart';

class DefaultRawPageWithMargin extends StatelessWidget {
  final Widget child;

  const DefaultRawPageWithMargin({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(margin: const EdgeInsets.only(top: 36.0), child: child);
  }
}
