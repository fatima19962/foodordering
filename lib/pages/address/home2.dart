import 'package:flutter/material.dart';

class Home2 extends StatefulWidget {
  Home2({Key? key}) : super(key: key);

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(title: Text('Page 1'),),
      body: Container(
          // child: ElevatedButton(
          //   style:ButtonStyle(
          //     backgroundColor: MaterialStateProperty.all(Colors.cyanAccent),
          //     foregroundColor:MaterialStateProperty.all(Colors.cyan),
          //   ),
          //   onPressed: () { },
          //   child: Text('Looks like a RaisedButton'),
          // )


    ),
    );
  }
}
