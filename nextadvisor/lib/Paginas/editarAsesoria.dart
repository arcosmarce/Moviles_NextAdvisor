import 'package:nextadvisor/controladores/databasehelper.dart';
import 'package:nextadvisor/Paginas/consultarAsesorias.dart';
import 'package:flutter/material.dart';


class editarAsesoria extends StatefulWidget {

  final List list;
  final int index;

  EditProduct({this.list, this.index});


  @override
  _editarAsesoriaState createState() => _editarAsesoriaState();
}

class _editarAsesoriaState extends State<EditProduct> {


  DataBaseHelper databaseHelper = new DataBaseHelper();

  TextEditingController controllerFecha;
  TextEditingController controllerTarifa;
  TextEditingController controllerMateria;
  TextEditingController controllerId;

  @override
  void initState() {

    controllerId= new TextEditingController(text: widget.list[widget.index]['oferta_id'].toString() );
    controllerFecha= new TextEditingController(text: widget.list[widget.index]['oferta_fecha'].toString() );
    controllerTarifa= new TextEditingController(text: widget.list[widget.index]['oferta_tarifa'].toString() );
    controllerMateria= new TextEditingController(text: widget.list[widget.index]['materia_id'].toString() );
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
                      if (value.isEmpty) return "Ingresa una fecha";
                    },
                    decoration: new InputDecoration(
                      hintText: "oferta_fecha", labelText: "oferta_fecha",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerTarifa,
                    validator: (value) {
                      if (value.isEmpty) return "Tarifa";
                    },
                    decoration: new InputDecoration(
                      hintText: "oferta_tarifa", labelText: "oferta_tarifa",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.settings_input_component, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerMateria,
                    validator: (value) {
                      if (value.isEmpty) return "Ingresa una materia";
                    },
                    decoration: new InputDecoration(
                      hintText: "materia_id", labelText: "materia_id",
                    ),
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
                  onPressed: (){
                    databaseHelper.editarAsesoria(
                        controllerId.text.trim(), controllerFecha.text.trim(), controllerTarifa.text.trim(), controllerMateria.text.trim());
                    Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context) => new consultarAsesorias(),
                        )
                    );
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