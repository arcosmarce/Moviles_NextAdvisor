import 'package:nextadvisor/controladores/databasehelper.dart';
import 'package:nextadvisor/main.dart';
import 'package:flutter/material.dart';

class AddDataAsesoria extends StatefulWidget {
  AddDataAsesoria({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AddDataAsesoriaState createState() => _AddDataAsesoriaState();
}

class _AddDataAsesoriaState extends State<AddDataAsesoria> {
  DataBaseHelper databaseHelper = new DataBaseHelper();

  final TextEditingController _fechaController = new TextEditingController();
  final TextEditingController _tarifaController = new TextEditingController();
  final TextEditingController _materiaController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Product',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Registrar Asesoria'),
        ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(
                top: 62, left: 12.0, right: 12.0, bottom: 12.0),
            children: <Widget>[
              Container(
                height: 50,
                child: new TextField(
                  controller: _fechaController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: 'oferta_fecha',
                    hintText: 'Fecha',
                    icon: new Icon(Icons.email),
                  ),
                ),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: _tarifaController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'oferta_tarifa',
                    hintText: 'Tarifa',
                    icon: new Icon(Icons.vpn_key),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: _materiaController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'materia_id',
                    hintText: 'Materia',
                    icon: new Icon(Icons.vpn_key),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new RaisedButton(
                  onPressed: () {
                    databaseHelper.addDataAsesoria(
                        _fechaController.text.trim(),
                        _tarifaController.text.trim(),
                        _materiaController.text.trim());
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new MainPage(),
                    ));
                  },
                  color: Colors.blue,
                  child: new Text(
                    'Add',
                    style: new TextStyle(
                        color: Colors.white, backgroundColor: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
