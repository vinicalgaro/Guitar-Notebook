import 'dart:ui';

import 'package:flutter/material.dart';

Future<T?> callBottomSheet<T>(BuildContext context, Widget page,
    {double heightPercent = 0.55}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.transparent,
    builder: (context) {
      return Stack(
        children: [
          BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container()),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * heightPercent,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: page,
            ),
          ),
        ],
      );
    },
  );
}
