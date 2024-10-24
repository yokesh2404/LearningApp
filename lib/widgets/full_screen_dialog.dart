import 'package:flutter/material.dart';
import 'package:kurups_app/utils/constants/colors.dart';

class FullScreenDialog {
  static void showFullScreenPopup(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true, // Dismiss when tapped outside
      barrierLabel: "",
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) {
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) {},
          child: const Scaffold(
            backgroundColor: Colors.transparent, // Transparent background
            body: SafeArea(
              child: Column(
                children: [],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1), // Slide from bottom
            end: const Offset(0, 0),
          ).animate(CurvedAnimation(
            parent: anim1,
            curve: Curves.easeOut,
          )),
          child: child,
        );
      },
    );
  }
}
