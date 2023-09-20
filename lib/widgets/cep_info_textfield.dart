import 'package:flutter/material.dart';

class CEPInfoTextField extends StatelessWidget {
  final String _label;
  final String _value;
  final TextStyle _textStyle = const TextStyle(
    fontSize: 18,
    color: Colors.black,
  );

  const CEPInfoTextField(this._label, this._value, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      showCursor: false,
      controller: TextEditingController(text: _value),
      decoration: InputDecoration(
        labelText: _label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      enabled: false,
      style: _textStyle,
    );
  }
}
