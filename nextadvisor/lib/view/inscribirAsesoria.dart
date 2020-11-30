import 'package:nextadvisor/controladores/databasehelper.dart';
import 'package:nextadvisor/main.dart';
import 'package:flutter/material.dart';

class InscribirAsesoriaPage extends StatefulWidget {
  @override
  _InscribirAsesoriaPage createState() => _InscribirAsesoriaPage();
}

class _InscribirAsesoriaPage extends State<InscribirAsesoriaPage> {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Hola"
    );
    /*FutureBuilder(
      future: ,
      builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Color(0xFF386FA4),
            ),
          );
        } else {
          return ListView(
            children: <Widget>[
            ],
          );
        }
      },
    );*/
  }
}
