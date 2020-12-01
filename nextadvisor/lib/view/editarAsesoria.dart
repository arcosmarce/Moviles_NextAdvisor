import 'package:nextadvisor/Controladores/databasehelper.dart';
import 'package:nextadvisor/view/consultarAsesoria.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditarAsesoria extends StatefulWidget {
  final List list;
  final int index;

  EditarAsesoria({this.list, this.index});

  @override
  _EditarAsesoriaState createState() => _EditarAsesoriaState();
}

class _EditarAsesoriaState extends State<EditarAsesoria> {
  DataBaseHelper databaseHelper = new DataBaseHelper();

  TextEditingController controllerFecha;
  TextEditingController controllerTarifa;
  TextEditingController controllerId;
  TextEditingController controllerMateria;

  @override
  void initState() {
    controllerId = new TextEditingController(
        text: widget.list[widget.index]['oferta_id'].toString());
    controllerFecha = new TextEditingController(
        text: widget.list[widget.index]['oferta_fecha'].toString());
    controllerTarifa = new TextEditingController(
        text: widget.list[widget.index]['oferta_tarifa'].toString());
    controllerMateria = new TextEditingController(
        text: widget.list[widget.index]['materia_id'].toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Editar Asesoria"),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new Column(
              children: <Widget>[
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerFecha,
                    validator: (value) {
                      if (value.isEmpty) return "oferta_fecha";
                    },
                    decoration: new InputDecoration(
                      hintText: "oferta_fecha",
                      labelText: "oferta_fecha",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerTarifa,
                    validator: (value) {
                      if (value.isEmpty) return "oferta_tarifa";
                    },
                    decoration: new InputDecoration(
                        hintText: "oferta_tarifa", labelText: "oferta_tarifa"),
                  ),
                ),
               
                const Divider(
                  height: 1.0,
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("Editar"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    databaseHelper.editarAsesoria(
                        controllerFecha.text.trim(),
                        controllerTarifa.text.trim(),
                        controllerId.text.trim(),
                        controllerMateria.text.trim());

                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new ConsultarAsesorias(),
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
