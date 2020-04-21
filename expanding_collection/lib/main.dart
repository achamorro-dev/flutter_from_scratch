import 'package:expanding_collection/location_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Expanding Collection',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

List<LocationCard> locations = [
  LocationCard(
    title: 'New York',
    imageUrl:
        'https://image.freepik.com/foto-gratis/skyline-ciudad-nueva-york-centro-manhattan-rascacielos-al-atardecer-ee-uu_56199-56.jpg',
  ),
  LocationCard(
    title: 'San Francisco',
    imageUrl:
        'https://image.freepik.com/foto-gratis/puente-golden-gate-san-francisco_119101-1.jpg',
  ),
  LocationCard(
    title: 'Madrid',
    imageUrl:
        'https://image.freepik.com/foto-gratis/horizonte-ciudad-madrid-dia_119101-27.jpg',
  ),
  LocationCard(
    title: 'Chicago',
    imageUrl:
        'https://image.freepik.com/foto-gratis/horizonte-chicago-ferrocarril_1426-1021.jpg',
  ),
];

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _currentPage = 1.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFa0b0c1),
      appBar: AppBar(
        backgroundColor: Color(0xFFa0b0c1),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.location_searching),
            onPressed: () {},
          )
        ],
        title: Text('TOFIND'),
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: PageController(
              initialPage: 1,
              viewportFraction: 0.82,
            ),
            onPageChanged: (page) {
              setState(() {
                _currentPage = page.toDouble();
              });
            },
            itemCount: locations.length,
            itemBuilder: (BuildContext context, int index) {
              return AnimatedOpacity(
                opacity: index.toDouble() == _currentPage ? 1.0 : 0.2,
                duration: Duration(
                  milliseconds: 200,
                ),
                child: locations[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 60.0),
              child: Text(
                '${_currentPage.toInt() + 1} / ${locations.length}',
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
