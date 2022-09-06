import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wedding_jc/features/home_page.dart';

class NavigationManager {
  BuildContext context;

  NavigationManager(this.context);

  void openScreen(Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  void goToHomeScreen() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
      (Route<dynamic> route) => false,
    );
  }

  void back() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      SystemNavigator.pop();
    }
  }
}
