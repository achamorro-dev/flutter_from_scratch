import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {

  final Widget child;
  final Function onPressedActionButton;
  final bool firstPage;

  const LoginPage({Key key, this.child, this.onPressedActionButton, this.firstPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          Positioned(
            top: -150,
            child: Image(
              image: AssetImage('assets/images/background.png'),
              width: maxWidth * 2,
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: maxWidth,
              height: maxHeight * 0.3,
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
            bottom: maxHeight * -0.3,
            left: maxWidth * -0.5,
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
              child: child
            )
          ),
          Positioned(
            left: 40,
            bottom: 30,
            child: Row(
              children: [
                Container(
                  color: firstPage ? primaryColor : Theme.of(context).disabledColor,
                  width: 30,
                  height: 2
                ),
                SizedBox(width: 10,),     
                Container(
                  color: firstPage ? Theme.of(context).disabledColor : primaryColor,
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
              onPressed: onPressedActionButton,
              backgroundColor: primaryColor,
              child: Icon(Icons.chevron_right, size: 40,)
            ),
          )
        ]
      )
    );
  }
}