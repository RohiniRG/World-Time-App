import 'package:flutter/material.dart';

class ChoooseLocation extends StatefulWidget {
  @override
  _ChoooseLocationState createState() => _ChoooseLocationState();
}

class _ChoooseLocationState extends State<ChoooseLocation> {
  void getData() async {
    // Simulating a network request from a database

    String username = await Future.delayed(Duration(seconds: 3), () {
      return 'DELAYYY! got info tho';
    });

    // print('BLAH'); // Doesn't wait for the the future.delayed part to get printed

    // Similating request to get more info
    String bio = await Future.delayed(Duration(seconds: 2), () {
      return 'INFO INFO!';
    });

    print('$username + $bio');
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.teal[700],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: RaisedButton(
        onPressed: () {
          setState(() {
            // causes rebuild
          });
        },
        // child: Text('Count is $count'),
      ),
    );
  }
}
