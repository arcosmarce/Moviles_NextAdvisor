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
String nombreRol;
Future<Usuario> getUsuario() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  nombreRol= sharedPreferences.getString("nombreRol");
  String id = sharedPreferences.getInt('cuenta_id').toString();
  final response = await http.get(
      "http://api.nextadvisor.com.mx/api/cuenta/obtenerCuenta/" + id,
      headers: {
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
            child: CircularProgressIndicator(
              backgroundColor: Color(0xFF386FA4),
            ),
          );
        } else {
          return ListView(
            children: <Widget>[
              //Rol
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Text(
                  nombreRol,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    wordSpacing: 2.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              //Imagen
              Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Icon(
                    Icons.book,
                    color: Color(0xFF133C55),
                    size: 90.0,
                  )),
              //Nombre usuario
              Container(
                padding: EdgeInsets.fromLTRB(5.0, 0, 0, 10),
                child: Text(
                  snapshot.data.cuentaNombreUsuario,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    wordSpacing: 2.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              //Califiacion
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.star_outline,
                        color: Color(0xFF133C55),
                        size: 35.0,
                      ),
                    ),
                    Container(
                      child: Icon(
                        Icons.star_outline,
                        color: Color(0xFF133C55),
                        size: 35.0,
                      ),
                    ),
                    Container(
                      child: Icon(
                        Icons.star_outline,
                        color: Color(0xFF133C55),
                        size: 35.0,
                      ),
                    ),
                    Container(
                      child: Icon(
                        Icons.star_outline,
                        color: Color(0xFF133C55),
                        size: 35.0,
                      ),
                    ),
                    Container(
                      child: Icon(
                        Icons.star_outline,
                        color: Color(0xFF133C55),
                        size: 35.0,
                      ),
                    ),
                  ],
                ),
              ),
              //Nombre
              Container(
                margin: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.account_circle,
                        color: Color(0xFF133C55),
                        size: 35.0,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                      child: Text(
                        "Nombre",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          wordSpacing: 2.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30.0, 10, 0, 0),
                child: Text(
                  snapshot.data.cuentaNombre +
                      ' ' +
                      snapshot.data.cuentaApellidoMaterno +
                      ' ' +
                      snapshot.data.cuentaApellidoMaterno,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2.0,
                    wordSpacing: 2.0,
                  ),
                ),
              ),
              //Genero
              Container(
                margin: EdgeInsets.fromLTRB(0, 30.0, 0, 0),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.face,
                        color: Color(0xFF133C55),
                        size: 35.0,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                      child: Text(
                        "Genero",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          wordSpacing: 2.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30.0, 10, 0, 0),
                child: Text(
                  snapshot.data.cuentaGenero,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2.0,
                    wordSpacing: 2.0,
                  ),
                ),
              ),
              //Correo
              Container(
                margin: EdgeInsets.fromLTRB(0, 30.0, 0, 0),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.email,
                        color: Color(0xFF133C55),
                        size: 35.0,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                      child: Text(
                        "Correo",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          wordSpacing: 2.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30.0, 10, 0, 0),
                child: Text(
                  snapshot.data.cuentaCorreo,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2.0,
                    wordSpacing: 2.0,
                  ),
                ),
              ),
              //Telefono
              Container(
                margin: EdgeInsets.fromLTRB(0, 30.0, 0, 0),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.phone,
                        color: Color(0xFF133C55),
                        size: 35.0,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                      child: Text(
                        "Telefono",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          wordSpacing: 2.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30.0, 10, 0, 0),
                child: Text(
                  snapshot.data.cuentaTelefono,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2.0,
                    wordSpacing: 2.0,
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
