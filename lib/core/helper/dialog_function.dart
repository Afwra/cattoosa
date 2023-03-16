import 'package:flutter/material.dart';

void showCustomDialog(BuildContext context, Widget data) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.white,
    transitionDuration: const Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) {
      return SizedBox(height: 100, width: 300, child: data);
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
