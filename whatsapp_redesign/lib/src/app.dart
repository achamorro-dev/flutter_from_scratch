import 'package:flutter/material.dart';

import 'package:whatsapp_redesign/src/themes/theme.dart';
import 'package:whatsapp_redesign/src/screens/login_screen.dart';
import 'package:whatsapp_redesign/src/screens/login_otp_screen.dart';
import 'package:whatsapp_redesign/src/pages/dashboard_page.dart';
 
class WhatsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      initialRoute: 'login',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        'login': (BuildContext context) => LoginScreen(),
        'login_otp': (BuildContext context) => LoginOTPScreen(),
        'dashboard': (BuildContext context) => DashboardPage(),
      },
    );
  }
}