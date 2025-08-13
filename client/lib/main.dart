import 'package:flutter/material.dart';
import 'package:music_player/core/theme/theme.dart';

import 'features/auth/view/pages/signup_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:AppTheme.darkThemeMode,
      home: const SignupPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
