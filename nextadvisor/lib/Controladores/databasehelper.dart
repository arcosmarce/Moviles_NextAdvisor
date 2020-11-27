import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DataBaseHelper {
  String serverUrl = "http://api.nextadvisor.com.mx/api/";
  String serverUrlAsesorias = "http://api.nextadvisor.com.mx/api/asesoria";
  var status;
  var token;

  //Funcion para registrar asesoria
  void addDataAsesoria(String _fechaController, String _tarifaController,
      String _materiaController) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    // String myUrl = "$serverUrl/api";
    String myUrl = "http://api.nextadvisor.com.mx/api/asesoria";
    final response = await http.post(myUrl, headers: {
      'Accept': 'application/json'
    }, body: {
      "oferta_fecha": "$_fechaController",
      "oferta_tarifa": "$_tarifaController",
      "materia_id": "$_materiaController"
    });
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if (status) {
      print('data : ${data["error"]}');
    } else {
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }

//fFuncion Actualizar asesoria
  void editarAsesoria(String controllerId, String controllerFecha,
      String controllerTarifa, String controllerMateria) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "http://api.nextadvisor.com.mx/api/asesoria/$controllerId";
    http.put(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    }, body: {
      "oferta_fecha": "$controllerFecha",
      "oferta_tarifa": "$controllerTarifa",
      "materia_id": "$controllerMateria"
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

//Funcion para eliminar el registro de una asesoria
  void removeRegister(String oferta_id) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "http://api.nextadvisor.com.mx/api/asesoria/$oferta_id";
    http.delete(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  //funciton getData
  Future<List> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrlAsesorias";
    http.Response response = await http.get(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    });
    return json.decode(response.body);
  }

  //function save
  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

//function read
  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }
}
