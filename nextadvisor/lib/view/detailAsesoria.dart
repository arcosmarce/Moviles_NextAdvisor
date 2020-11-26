import 'package:nextadvisor/view/editarAsesoria.dart';
import 'package:nextadvisor/view/consultarAsesoria.dart';
import 'package:flutter/material.dart';
import 'package:nextadvisor/Controladores/databasehelper.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index, this.list});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  DataBaseHelper databaseHelper = new DataBaseHelper();

  //create function delete
  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Esta seguto de eliminar '${widget.list[widget.index]['oferta_fecha']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text(
            "OK",
            style: new TextStyle(color: Colors.black),
          ),
          color: Colors.red,
          onPressed: () {
            databaseHelper.removeRegister(
                widget.list[widget.index]['oferta_id'].toString());
            Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new ConsultarAsesorias(),
            ));
          },
        ),
        new RaisedButton(
          child:
              new Text("CANCELAR", style: new TextStyle(color: Colors.black)),
          color: Colors.green,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

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
                  widget.list[widget.index]['oferta_fecha'],
                  style: new TextStyle(fontSize: 20.0),
                ),
                Divider(),
                new Text(
                  "Tarifa: ${widget.list[widget.index]['oferta_tarifa']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("Editar"),
                      color: Colors.blueAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new EditarAsesoria(
                          list: widget.list,
                          index: widget.index,
                        ),
                      )),
                    ),
                    VerticalDivider(),
                    new RaisedButton(
                      child: new Text("Eliminar"),
                      color: Colors.redAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () => confirm(),
                    ),
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
