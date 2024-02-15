import 'package:flutter/material.dart';
import 'package:social_book/View/splash_screen.dart';

void main(List<String> args) {
  // runApp(DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) {
  //     return const SocialBook();
  //   },
  // ));
  runApp(const SocialBook());
}

class SocialBook extends StatelessWidget {
  const SocialBook({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData.light(),
    );
  }
}
