import 'dart:math';

import 'package:flutter/material.dart';

enum READ_STATUSES {
  SENT,
  DELIVERED,
  READED
}

class ReadStatus extends StatelessWidget {

  final READ_STATUSES status;
  final double size;

  const ReadStatus({Key key, this.status, this.size, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          status != READ_STATUSES.SENT ?
            Positioned(
              left: 4,
              child: Icon(
                Icons.check,
                size: size * 0.8,
                color: status == READ_STATUSES.READED ?
                  Theme.of(context).primaryColor :
                  Theme.of(context).disabledColor
              )
            ) : 
            Container(),
          Icon(
            Icons.check,
            size: size * 0.8,
            color: status == READ_STATUSES.READED ?
              Theme.of(context).primaryColor :
              Theme.of(context).disabledColor
          ),
        ],
      ),
    );
  }
}

Widget getReadStatusRandom() {
    int rndm = Random().nextInt(3);
    return ReadStatus(
      status: rndm == 0 ?
        READ_STATUSES.DELIVERED :
        (
          rndm > 1 ? 
            READ_STATUSES.READED :
            READ_STATUSES.SENT
        ) ,
      size: 26,
    );
  }