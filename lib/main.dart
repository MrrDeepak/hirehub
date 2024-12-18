import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/screens/new_splash_screen.dart';
import 'package:seek_forms/screens/splashScreen.dart';
import 'util.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        final brightness =
            View.of(context).platformDispatcher.platformBrightness;
        TextTheme textTheme = createTextTheme(context, "Roboto Flex", "Roboto");

        MaterialTheme theme = MaterialTheme(textTheme);

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: brightness == Brightness.light ? theme.light() : theme.light(),
          home: NewSplashScreen(),
          // Splashscreen(),
        );
      },
    );
  }
}
