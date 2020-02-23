import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_redesign/src/models/user_model.dart';

class UserStatusAvatarWidget extends StatelessWidget {

  final User user;
  final double size;

  const UserStatusAvatarWidget({Key key, @required this.user, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(6),
                height: size,
                width: size,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size / 2),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 3,
                  ),
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(user.picture),
                ),
              ),
              SizedBox(height: 8,),
              Text(
                user.firstName,
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