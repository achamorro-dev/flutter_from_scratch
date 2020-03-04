import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_redesign/src/pages/login_page.dart';

class LoginOTPScreen extends StatefulWidget {
  const LoginOTPScreen({Key key}) : super(key: key);

  @override
  _LoginOTPScreenState createState() => _LoginOTPScreenState();
}

class _LoginOTPScreenState extends State<LoginOTPScreen> {
  
  @override
  Widget build(BuildContext context) {

    return LoginPage(
      onPressedActionButton: () {
        Navigator.pushNamed(context, 'dashboard');
      },
      firstPage: false,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Waiting to automatically detect and\nsms sent',
              style: GoogleFonts.poppins().copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                getDigitTextField(context),
                getDigitTextField(context),
                getDigitTextField(context),
                getDigitTextField(context),
              ],
            ),
            SizedBox(height: 40),
            RichText(
              text: TextSpan(
                text: 'Didn\'t receive the code?',
                style: GoogleFonts.poppins().copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).disabledColor
                ),
                children: [
                  TextSpan(
                    text: ' RESEND CODE',
                    style: GoogleFonts.poppins().copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700
                    )
                  )
                ]
              ),
            )
          ],
        )
    );
  }

  Widget getDigitTextField(context) {

    TextStyle textFieldStyle =
    GoogleFonts.poppins().copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: Theme.of(context).primaryColor
    );

    InputDecoration textFieldDecoration = InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).primaryColor)
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).primaryColor)
      ),
    );

    return Container(
      width: MediaQuery.of(context).size.width * 0.15,
      child: TextField(
        controller: TextEditingController(text: '9'),
        style: textFieldStyle,
        decoration: textFieldDecoration,
        textAlign: TextAlign.center,
      ),
    );
  }
}