import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:nextadvisor/view/detailAsesoria.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConsultarPreguntas extends StatefulWidget {
  @override
  _ConsultarPreguntasState createState() => _ConsultarPreguntasState();
}

class _ConsultarPreguntasState extends State<ConsultarPreguntas> {
  List data;

  Future<List> getData() async {
    final response =
        await http.get("http://api.nextadvisor.com.mx/api/pregunta");
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Preguntas Frecuentes"),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                 
                )
                
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list, list2;
  ItemList({this.list, this.list2});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(

            child: new Card(
              child: new ListTile(
                title: new Text(
                  list[i]['pregunta_pregunta'].toString(),
                 
                  style: TextStyle(fontSize: 25.0, color: Colors.blueAccent),
                ),
              ),
            ),
          ),
          
        );
      },
    );
  }
}
