import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          Positioned(
            top: -150,
            child: Image(
              image: AssetImage('assets/images/background.png'),
              width: MediaQuery.of(context).size.width * 2,
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/images/logo.png'),
                    height: 60,
                  ),
                  SizedBox(width: 8,),
                  Text(
                    'WhatsApp',
                    style: GoogleFonts.poppins().copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * -0.3,
            left: MediaQuery.of(context).size.width * -0.5,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 2,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.6,
                vertical: 100
              ),
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
                        print(value);
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
            ),
          ),
          Positioned(
            left: 40,
            bottom: 30,
            child: Row(
              children: [
                Container(
                  color: Theme.of(context).primaryColor,
                  width: 30,
                  height: 2
                ),
                SizedBox(width: 10,),     
                Container(
                  color: Theme.of(context).disabledColor,
                  width: 30,
                  height: 2
                )
              ]
            ),
          ),
          Positioned( 
            bottom: 30,
            right: 30,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(Icons.chevron_right, size: 40,)
            ),
          )
        ],
      )
    );
  }
}