import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    // print(data);

    // Set bg
    String bg = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDaytime'] ? Colors.lightBlue[400] : Colors.indigo;
    Color fontColor = data['isDaytime'] ? Colors.black : Colors.white;

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/$bg'),
            fit: BoxFit.cover,
          )),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(
                0,
                120.0,
                0,
                0,
              ),
              // Safe Area brings the text to a visible area when there is no app bar
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context,
                          '/choose_loc'); // Pushing a new screen on top of it
                      if (result != null) {
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDaytime': result['isDaytime'],
                            'flag': result['flag']
                          };
                        });
                      }
                      // Pushing just places a new screen which can be reverted by back button
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: fontColor,
                    ),
                    label: Text(
                      'Edit Location',
                      style: TextStyle(color: fontColor),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                            fontSize: 20.0,
                            letterSpacing: 2.0,
                            color: fontColor),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    data['time'],
                    style: TextStyle(fontSize: 66.0, color: fontColor),
                  ),
                ],
              )),
        )));
  }
}
