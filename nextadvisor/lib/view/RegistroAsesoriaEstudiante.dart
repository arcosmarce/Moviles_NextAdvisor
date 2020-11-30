import 'package:nextadvisor/Controladores/databasehelper.dart';
import 'package:nextadvisor/view/consultarAsesoriaEstudiate.dart';
import 'package:flutter/material.dart';

class Registro extends StatefulWidget {
  final List list;
  final int index;

  Registro({this.list, this.index});

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  DataBaseHelper databaseHelper = new DataBaseHelper();

  TextEditingController controllerOferta;
  TextEditingController controllerEstudiante;
  TextEditingController controllerCalificacion;

  @override
  void initState() {
    controllerOferta = new TextEditingController(
        text: widget.list[widget.index]['oferta_id'].toString());
    controllerEstudiante = new TextEditingController(
        text: widget.list[widget.index]['estudiante_id'].toString());
    controllerCalificacion = new TextEditingController(
        text: widget.list[widget.index]['asesoria_calificacion'].toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Registrarme a una asesoria"),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new Column(
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
                const Divider(
                  height: 1.0,
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("Registrarme"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    databaseHelper.registro(
                        controllerOferta.text.trim(),
                        controllerEstudiante.text.trim(),
                        controllerCalificacion.text.trim());

                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new ConsultarAsesoriaEstudiante(),
                    ));
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
