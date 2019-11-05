import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_icons/weather_icons.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Stack(
              children: <Widget>[
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          'Clear',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              color: Colors.grey.shade50),
                        ),
                        SizedBox(height: 10),
                        Icon(
                          WeatherIcons.day_sunny,
                          size: 62,
                          color: Colors.yellow,
                        ),
                        SizedBox(height: 20),
                        Text(
                          '19°',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 72,
                            color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: FloatingActionButton(
                      onPressed: () {},
                      tooltip: 'Add Location',
                      child: Icon(Icons.add),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.yellow.shade700,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'SYDNEY, AUSTRALIA',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.blue,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var heightToCut = size.height;
    path.lineTo(0, heightToCut);
    path.quadraticBezierTo(
        size.width / 4, heightToCut - 40, size.width / 2, heightToCut - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, heightToCut, size.width, heightToCut - 35);
    path.lineTo(size.width, 0);
    path.close(); // this closes the loop from current position to the starting point of widget
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
