import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
              TextFormField(
                controller: SuhuController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  hintText: 'Masukkan Suhu Dalam Celcius',
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Suhu dalam Kelvin',
                              style: TextStyle(color: Colors.black)),
                          Text('$kelvin',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                        ],
                      ),
                      margin: EdgeInsets.all(8),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Suhu dalam Reamur',
                              style: TextStyle(color: Colors.black)),
                          Text('$reamur',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                        ],
                      ),
                      margin: EdgeInsets.all(8),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                child: Text(
                  "Konversi Suhu",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                color: Colors.blue,
                onPressed: () {
                  setState(() {
                    inputSuhu = double.parse(SuhuController.text);
                    kelvin = inputSuhu + 273;
                    reamur = (4 / 5) * inputSuhu;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*String validatorAngka(String value) {
  if (value.length != 4)
    return 'Input harus Angka';
  else
    return null;
}*/
