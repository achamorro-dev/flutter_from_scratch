import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_redesign/src/pages/login_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final List<String> countryItems = [
    '🇨🇦  Canada',
    '🇫🇷  France',
    '🇮🇳  India',
    '🇪🇸  Spain',
    '🇬🇧  United Kingdom',
    '🇺🇸  United States',
  ];

  String countryValue;

  @override
  Widget build(BuildContext context) {

    TextStyle textFieldStyle =
    GoogleFonts.poppins().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.black
    );

    InputDecoration textFieldDecoration = InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).primaryColor)
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).primaryColor)
      )
    );

    return LoginPage(
      onPressedActionButton: () {
        Navigator.pushNamed(context, 'login_otp');
      },
      firstPage: true,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Enter your mobile number to\nlogin or register',
              style: GoogleFonts.poppins().copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Country',
              style: GoogleFonts.poppins().copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).disabledColor
              ),
            ),
            DropdownButton<String>(
              onChanged: (value) {
                setState(() {
                  countryValue = value;
                });
              },
              items: countryItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              value: countryValue,
              style: textFieldStyle,
              isExpanded: true,
              iconEnabledColor: Theme.of(context).primaryColor,
              underline: Container(color:Theme.of(context).primaryColor, height: 1.0),
            ),
            SizedBox(height: 40),
            Text(
              'Your Mobile Number',
              style: GoogleFonts.poppins().copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).disabledColor
              ),
            ),
            Row(
              children: [
                Container(
                  width: 40,
                  child: TextField(
                    style: textFieldStyle,
                    decoration: textFieldDecoration,
                    controller: TextEditingController(
                      text: '+91'
                    ),
                  ),
                ),
                SizedBox(width: 30,),
                Expanded(  
                  child: TextField(
                    style: textFieldStyle,
                    decoration: textFieldDecoration.copyWith(
                      suffixIcon: Icon(Icons.check_circle, color: Color(0xFF25D366),)
                    ),
                    controller: TextEditingController(
                      text: '77150 46761'
                    ),
                  ),
                )
              ]
            ),
          ],
        )
    );
  }
}