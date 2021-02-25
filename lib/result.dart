import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key key,
    @required this.kelvin,
    @required this.reamur,
  }) : super(key: key);

  final double kelvin;
  final double reamur;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                    style: TextStyle(color: Colors.black, fontSize: 20)),
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
                    style: TextStyle(color: Colors.black, fontSize: 20)),
              ],
            ),
            margin: EdgeInsets.all(8),
          ),
        ],
      ),
    );
  }
}
