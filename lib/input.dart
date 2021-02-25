import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  const Input({
    Key key,
    @required this.SuhuController,
  }) : super(key: key);

  final TextEditingController SuhuController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: SuhuController,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: InputDecoration(
        hintText: 'Masukkan Suhu Dalam Celcius',
      ),
    );
  }
}
