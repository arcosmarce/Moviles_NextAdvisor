
import 'package:nextadvisor/view/Perfil.dart';
import 'package:nextadvisor/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
import 'consultarMisAsesorias.dart';
import 'consultarAsesoriaEstudiate.dart';
import 'consultarFAQS.dart';

class EstudiantePage extends StatefulWidget {
  @override
  _EstudiantePageState createState() => _EstudiantePageState();
}

class _EstudiantePageState extends State<EstudiantePage> {
  SharedPreferences sharedPreferences;
  int _currentIndex = 0;
  
  final List<Widget> _children = [
    
    HomeWidget(),
    PerfilWidget(),
    ConsultarAsesoriaEstudiante(),
    Consultar(),
    ConsultarPreguntas()

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
            child: Text("Cerrar sesión", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Center(
          child: Container(
        padding: EdgeInsets.all(15.0),
        child: _children[_currentIndex],
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 30,
        unselectedItemColor: Color(0xFF386FA4),
        selectedItemColor: Color(0xFF386FA4),
        items: [
          
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Cuenta')),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('Asesorias')),
          BottomNavigationBarItem(icon: Icon(Icons.how_to_reg), title: Text('Mis asesorias')),
          BottomNavigationBarItem(icon: Icon(Icons.help), title: Text('FAQS'))
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

