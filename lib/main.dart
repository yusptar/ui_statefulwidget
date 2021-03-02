import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'convert.dart';
import 'input.dart';
import 'result.dart';
import 'riwayatkonversi.dart';

void main() => runApp(Suhu());

class Suhu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainSuhu();
}

class MainSuhu extends State<Suhu> {
  final SuhuController = TextEditingController();
  double _inputSuhu = 0;
  String _valueDropDown = "Kelvin";
  double _result = 0;

  List<String> ListString = ["Kelvin", "Reamur", "Fahrenheit"];
  // ignore: deprecated_member_use
  List<String> listViewItem = List<String>();

  void rumusSuhu() => setState(() {
        _inputSuhu = double.parse(SuhuController.text);
        if (_valueDropDown == "Kelvin")
          _result = _inputSuhu + 273;
        else if (_valueDropDown == "Reamur")
          _result = (4 / 5) * _inputSuhu;
        else
          _result = (_inputSuhu * 9 / 5) + 32;
        listViewItem.add("$_valueDropDown : $_result");
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
                value: _valueDropDown,
                onChanged: (String changeValue) {
                  setState(() {
                    _valueDropDown = changeValue;
                    rumusSuhu();
                  });
                },
              ),
              Result(result: _result),
              Convert(convertHandler: rumusSuhu),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: RiwayatKonversi(listViewItem: listViewItem),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
