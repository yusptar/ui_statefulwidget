import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'convert.dart';
import 'input.dart';
import 'result.dart';

void main() => runApp(Suhu());

class Suhu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainSuhu();
}

class MainSuhu extends State<Suhu> {
  final SuhuController = TextEditingController();
  double _inputSuhu = 0;
  double _reamur = 0;
  double _kelvin = 0;
  double _fahrenheit = 0;

  List<String> ListString = ["Kelvin", "Reamur", "Fahrenheit"];
  String valueDropDown = "Kelvin";

  void rumusSuhu() => setState(() {
        _inputSuhu = double.parse(SuhuController.text);
        _kelvin = _inputSuhu + 273;
        _reamur = (4 / 5) * _inputSuhu;
        _fahrenheit = (_inputSuhu * 9 / 5) + 32;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Input(SuhuController: SuhuController),
              DropdownButton<String>(
                items: ListString.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: valueDropDown,
                onChanged: (String changeValue) {
                  setState(() {
                    valueDropDown = changeValue;
                  });
                },
              ),
              Result(kelvin: _kelvin, reamur: _reamur),
              Convert(convertHandler: rumusSuhu),
            ],
          ),
        ),
      ),
    );
  }
}
