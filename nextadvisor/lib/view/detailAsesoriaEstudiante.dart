import 'package:nextadvisor/view/editarAsesoria.dart';
import 'package:nextadvisor/view/consultarAsesoria.dart';
import 'package:nextadvisor/view/RegistroAsesoriaEstudiante.dart';
import 'package:flutter/material.dart';
import 'package:nextadvisor/Controladores/databasehelper.dart';

class DetailEstudiante extends StatefulWidget {
  List list;
  int index;
  DetailEstudiante({this.index, this.list});

  @override
  _DetailEstudianteState createState() => _DetailEstudianteState();
}

class _DetailEstudianteState extends State<DetailEstudiante> {
  DataBaseHelper databaseHelper = new DataBaseHelper();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("${widget.list[widget.index]['oferta_fecha']}")),
      body: new Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Text(
                  "Fecha:  ${widget.list[widget.index]['oferta_fecha']}",
                  style: new TextStyle(fontSize: 20.0),
                ),
                Divider(),
                new Text(
                  "Tarifa por hora: ${widget.list[widget.index]['oferta_tarifa']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("Registrarme"),
                      color: Colors.blueAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new Registro(
                          list: widget.list,
                          index: widget.index,
                        ),
                      )),
                    ),
                    VerticalDivider(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
