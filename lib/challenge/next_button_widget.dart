import 'package:flutter/material.dart';

class NextButtonWidget extends StatelessWidget {

  final String label;

  NextButtonWidget({this.label});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: null,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,

          )
        )
    );
  }
}
