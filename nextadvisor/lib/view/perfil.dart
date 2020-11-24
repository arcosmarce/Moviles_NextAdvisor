import 'package:nextadvisor/models/usuario_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

class PerfilWidget extends StatefulWidget {
  @override
  _PerfilWidgetState createState() => _PerfilWidgetState();
}

Future<Usuario> getUsuario() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String id = sharedPreferences.getInt('cuenta_id').toString();
  final response = await http.get("http://192.168.1.74:8000/api/cuenta/obtenerCuenta/"+ id, headers: {
          "Authorization": "Bearer " + sharedPreferences.getString("token")
        });
  return usuarioFromJson(response.body);
}

class _PerfilWidgetState extends State<PerfilWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUsuario(),
      builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView(
            children: <Widget>[
              Text("Informacion personal", style: TextStyle(
                fontSize: 20,
                color: Color(0xFF386FA4),
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                wordSpacing:2.0,
              ),),
              Text(snapshot.data.cuentaNombre),
              Text(snapshot.data.cuentaApellidoPaterno),
              Text(snapshot.data.cuentaApellidoMaterno),
              Text(snapshot.data.cuentaCorreo),
              Text(snapshot.data.cuentaTelefono),
            ],
          );
        }
      },
    );
  }
}
