import 'dart:async';
import 'dart:convert';

import 'package:nextadvisor/Paginas/detailAsesoria.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class consultarAsesorias extends StatefulWidget {
  @override
  _consultarAsesoriasState createState() => _consultarAsesoriasState();
}

class _consultarAsesoriasState extends State<consultarAsesorias> {

  List data;

  Future<List> getData() async {
    final response = await http.get("http://localhost:8000/api/asesoria");
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
        title: new Text("Asesorias"),
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
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(
              new MaterialPageRoute(
                  builder: (BuildContext context) => new Detail(
                    list: list,
                    index: i,
                  )),
            ),
            child: new Card(
              child: new ListTile(
                title: new Text(
                  list[i]['oferta_fecha'].toString(),
                  style: TextStyle(fontSize: 25.0, color: Colors.orangeAccent),
                ),

              ),
            ),
          ),
        );
      },
    );
  }
}