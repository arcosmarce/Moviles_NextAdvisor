import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:nextadvisor/view/detailAsesoria.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConsultarAsesorias extends StatefulWidget {
  @override
  _ConsultarAsesoriasState createState() => _ConsultarAsesoriasState();
}

class _ConsultarAsesoriasState extends State<ConsultarAsesorias> {
  List data;

  Future<List> getData() async {
    final response =
        await http.get("http://api.nextadvisor.com.mx/api/asesoria");
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
                  list[i]['materia_nombre'].toString(),
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

@override
Widget build(BuildContext context) {
  return new Scaffold(
    body: new Container(
      height: 270.0,
      padding: const EdgeInsets.all(20.0),
      child: new Card(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new RaisedButton(
                      child: new Text("Editar"),
                      color: Colors.blueAccent,
                      onPressed: null),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
