import 'package:flutter/material.dart';

class FullScreenDialog {
  static void showFullScreenPopup(BuildContext context,
      {required Widget child}) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true, // Dismiss when tapped outside
      barrierLabel: "",
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) {
        return PopScope(
          canPop: true,
          onPopInvoked: (didPop) {},
          child: Scaffold(
            backgroundColor: Colors.white, // Transparent background
            body: child,
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
