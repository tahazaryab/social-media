import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:social_media/responsive/mobile_screen_layout.dart';
import 'package:social_media/responsive/responsive_layout_screen.dart';
import 'package:social_media/responsive/web_screen_layout.dart';
import 'package:social_media/utils/colours.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await dotenv.load(fileName: ".env");
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: dotenv.get('API_KEY'),
            appId: dotenv.get('APP_ID'),
            messagingSenderId: dotenv.get('MESSAGING_SENDER_ID'),
            projectId: dotenv.get('PROJECT_ID'),
            storageBucket: dotenv.get('STORAGE_BUCKET')));
  } else {
    await Firebase.initializeApp();
  }
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
