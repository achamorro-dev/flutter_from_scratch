import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_redesign/src/models/user_model.dart';
import 'package:whatsapp_redesign/src/widgets/read_status_widget.dart';
import 'package:whatsapp_redesign/src/widgets/user_avatar_widget.dart';

class ChatListViewItem extends StatelessWidget {

  final User user;

  const ChatListViewItem({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 80,
              width: 80,
              child: UserAvatarWidget(
                image: NetworkImage(user.picture),
                available: user.isConnected,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${user.firstName} ${user.lastName}',
                          style: GoogleFonts.poppins().copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          )
                        ),
                        Text(
                          _getTimeTextRandom(),
                          style: GoogleFonts.poppins().copyWith(
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).disabledColor
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        getReadStatusRandom(),
                        Text('Lorem impsdaosjma sd as daosod')
                      ]
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        Divider()
      ],
    );
  }
}

String _getTimeTextRandom() {
  int hour = Random().nextInt(12);
  int min = Random().nextInt(60);

  return '${hour < 10 ? '0$hour' : hour}:${min < 10 ? '0$min' : min}';
}