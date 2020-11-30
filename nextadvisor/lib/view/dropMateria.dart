/*import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class DropButton extends StatefulWidget {
  @override
  _DropButtonState createState() => _DropButtonState();
}

class _DropButtonState extends State<DropButton> {
  String dropdownValue = 'One';
  List data;
  @override
  void initState() {
    super.initState();
    getData();
  }

  Map<String, String> listarMateriaM Map();
  Map <Int,String> listarM Map();

  void pintarMaterias() {
    for (var i = 0; i < data.length; i++) {
      listarMateriaM[data[i]['materia_id']data[i]['materia_nombre']];

      ]
    }
  }

  Future<List> getData() async {
    final response =
        await http.get("http://api.nextadvisor.com.mx/api/materia");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
*/
