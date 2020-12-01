import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
     // child: Text("Next Advisor"),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 200.0),
     child: Column(
        children: <Widget>[
          Image.asset(
            'assets/mainlogo-darkbg.png',
            height: 300,
            width: 300,
          ),
        ],
      ),
    );
  }
}
