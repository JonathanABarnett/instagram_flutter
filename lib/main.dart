import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/responsive/mobile_screen_layout.dart';
import 'package:instagram_flutter/responsive/responsive_layout.dart';
import 'package:instagram_flutter/responsive/web_screen_layout.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/utils/dimensions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyCc-OfSUGOz17pfTHlGLJLGenH00UqOgGU',
        appId: '1:207595377709:web:5d33f4991f8701dcfcd4a4',
        messagingSenderId: '207595377709',
        projectId: 'flutter-instagram-2d6b5',
        storageBucket: 'flutter-instagram-2d6b5.appspot.com',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Picture App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: const ResponsiveLayout(
          mobileScreenLayout: MobileScreenLayout(),
          webScreenLayout: WebScreenLayout()),
    );
  }
}
