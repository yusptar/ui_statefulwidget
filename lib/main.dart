import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'input.dart';
import 'result.dart';

void main() => runApp(Suhu());

class Suhu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainSuhu();
}

class MainSuhu extends State<Suhu> {
  final SuhuController = TextEditingController();
  double inputSuhu = 0;
  double reamur = 0;
  double kelvin = 0;
  double fahrenheit = 0;

  void rumusSuhu() => setState(() {
        inputSuhu = double.parse(SuhuController.text);
        kelvin = inputSuhu + 273;
        reamur = (4 / 5) * inputSuhu;
        fahrenheit = (inputSuhu * 9 / 5) + 32;
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
              Result(kelvin: kelvin, reamur: reamur),
              Container(
                width: double.infinity,
                child: RaisedButton(
                  child: Text(
                    "Konversi Suhu",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    rumusSuhu();
                  },
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
