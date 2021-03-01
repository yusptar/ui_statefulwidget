import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  const Convert({
    Key key,
    @required this.convertHandler,
  }) : super(key: key);

  final Function convertHandler;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // ignore: deprecated_member_use
      child: RaisedButton(
        child: Text(
          "Konversi Suhu",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: convertHandler,
        color: Colors.blue,
      ),
    );
  }
}
