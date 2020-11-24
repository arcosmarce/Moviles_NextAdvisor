import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'Perfil.dart';
import 'asesoria.dart';
import 'home.dart';
import 'login.dart';

class AsesorPage extends StatefulWidget {
  @override
  _AsesorPageState createState() => _AsesorPageState();
}

class _AsesorPageState extends State<AsesorPage> {
  SharedPreferences sharedPreferences;
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeWidget(),
    PerfilWidget(),
    AsesoriaWidget()
  ];
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      appBar: AppBar(
        title: Text("Next Advisor", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF386FA4),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              sharedPreferences.clear();
              sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage()),
                  (Route<dynamic> route) => false);
            },
            child: Text("Log Out", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Center(child: _children[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 30,
        selectedItemColor: Color(0xFF386FA4),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Cuenta')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text('Asesorias')),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
