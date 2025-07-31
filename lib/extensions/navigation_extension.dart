import 'package:flutter/material.dart';

extension NavigationContext on BuildContext {
  void goTo(String appRoute, {Object? arguments}) {
    Navigator.pushNamed(
      this,
      appRoute,
      arguments: arguments,
    );
  }

  void goBack() {
    if (Navigator.canPop(this)) {
      Navigator.pop(this);
    }
  }
}
