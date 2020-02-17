import 'package:flutter/material.dart';

import 'package:whatsapp_redesign/src/screens/login_screen.dart';
import 'package:whatsapp_redesign/src/themes/theme.dart';
 
class WhatsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      initialRoute: 'login',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        'login': (BuildContext context) => LoginScreen()
      },
    );
  }
}