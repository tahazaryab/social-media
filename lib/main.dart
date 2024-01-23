import 'package:flutter/material.dart';
import 'package:social_media/responsive/mobile_screen_layout.dart';
import 'package:social_media/responsive/responsive_layout_screen.dart';
import 'package:social_media/responsive/web_screen_layout.dart';
import 'package:social_media/utils/colours.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      title: 'Flutter Demo',
      home: const ResponsiveLayout(
        mobileScreenLayout: MobileScreenLayout(),
        webScreenLayout: WebScreenLayout(),
      ),
    );
  }
}
