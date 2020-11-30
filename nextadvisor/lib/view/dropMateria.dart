/// Flutter code sample for DropdownButton

// This sample shows a `DropdownButton` with a large arrow icon,
// purple text style, and bold purple underline, whose value is one of "One",
// "Two", "Free", or "Four".
//
// ![](https://flutter.github.io/assets-for-api-docs/assets/material/dropdown_button.png)

import 'package:flutter/material.dart';
class Drop extends StatefulWidget {
  Drop({Key key}) : super(key: key);

  @override
  _DropState createState() => _DropState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _DropState extends State<Drop> {
  String dropdownValue = 'Calculo';

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
      items: <String>['Calculo', 'Modelación de la ingeniería y ciencias', 'Exploración de alto impacto', 'Genética humana','Técnicas y discursos fotográficos','Derecho laboral I','Farmacoterapia']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
