import 'package:flutter/material.dart';

class UserAvatarWidget extends StatelessWidget {

  final bool available;
  final ImageProvider image;

  const UserAvatarWidget({Key key, this.available, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) =>
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(constraints.maxWidth * 0.5),
              child: Image(
                image: image,
                height: constraints.maxHeight * 0.8,
                width: constraints.maxWidth * 0.8,
              ),
            ),
            Positioned(
              bottom: 0,
              left: constraints.maxWidth * 0.45,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: available ? Theme.of(context).primaryColor : Theme.of(context).disabledColor
                ),
              ),
            )
          ],
      )
    );
  }
}