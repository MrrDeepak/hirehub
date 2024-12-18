import 'package:flutter/material.dart';
import 'package:seek_forms/screens/authentication/create_account.dart';

class PageAnimation {
  Route createAccountRoute(Widget navigateTo) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => navigateTo,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0); // Start from the right
      const end = Offset.zero; // End at the original position
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      // var curvedAnimation = CurvedAnimation(
      //   parent: animation,
      //   curve: Interval(0.0, 1.0, curve: Curves.easeInOut),
      // );

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 500),
  );
}
}