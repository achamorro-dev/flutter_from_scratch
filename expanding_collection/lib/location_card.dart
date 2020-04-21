import 'package:flutter/material.dart';

class LocationCard extends StatefulWidget {
  final String title;
  final String imageUrl;

  LocationCard({Key key, this.title, this.imageUrl}) : super(key: key);

  @override
  _LocationCardState createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _expanded = !_expanded;
        });
      },
      child: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            AnimatedContainer(
                duration: Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                height: _expanded ? 400 : 300,
                width: _expanded ? 350 : 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text('La Crescenta-Montrose, CA91020'),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Flexible(flex: 3, child: Text('NO. 7911847')),
                        Flexible(
                          flex: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.star, color: Colors.purple[200]),
                              Icon(Icons.star, color: Colors.purple[200]),
                              Icon(Icons.star, color: Colors.purple[200]),
                              Icon(Icons.star, color: Colors.purple[200])
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Flexible(
                          flex: 3,
                          child: Row(
                            children: <Widget>[
                              _getUserAvatar(
                                  'https://randomuser.me/api/portraits/thumb/women/10.jpg'),
                              _getUserAvatar(
                                  'https://randomuser.me/api/portraits/thumb/men/1.jpg'),
                              _getUserAvatar(
                                  'https://randomuser.me/api/portraits/thumb/women/5.jpg'),
                              _getUserAvatar(
                                  'https://randomuser.me/api/portraits/thumb/men/10.jpg'),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Icon(Icons.more_vert),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                )),
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              width: 300,
              height: 350,
              margin: EdgeInsets.only(bottom: _expanded ? 150 : 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: _expanded
                    ? [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 5),
                          blurRadius: 10,
                        )
                      ]
                    : null,
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        widget.title,
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            'NORTH LAT 36',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Icon(Icons.location_on, color: Colors.white),
                          Text(
                            'EAST LNG 97',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ClipRRect _getUserAvatar(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image(
        image: NetworkImage(image),
        height: 30,
        width: 30,
      ),
    );
  }
}
