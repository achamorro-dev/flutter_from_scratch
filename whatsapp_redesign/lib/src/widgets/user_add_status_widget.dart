import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserAddStatusWidget extends StatelessWidget {

  final String pictureUrl;

  const UserAddStatusWidget({Key key, this.pictureUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 80,
            width: 80,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(6.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(pictureUrl),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 10,
                  child: Container(
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                    width: 25,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 22
                    )
                  )
                  
                )
              ],
            )
            
          ),
          SizedBox(height: 8,),
          Text(
            'Your Status',
            style: GoogleFonts.poppins().copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}