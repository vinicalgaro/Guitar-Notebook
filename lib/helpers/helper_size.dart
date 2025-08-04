import 'package:flutter/material.dart';

double percentHeight(BuildContext context, double percent,
    {double min = 0, double max = double.infinity}) {
  final h = MediaQuery.of(context).size.height * percent;
  return h.clamp(min, max);
}

double percentWidth(BuildContext context, double percent,
    {double min = 0, double max = double.infinity}) {
  final w = MediaQuery.of(context).size.width * percent;
  return w.clamp(min, max);
}
