import 'package:flutter/services.dart';

class CEPInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String oldText = newValue.text;
    if (oldText.length == 6) {
      oldText = oldText.replaceAll("-", "");
      String newText = "${oldText.substring(0, 5)}-${oldText.substring(5)}";

      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    }
    return newValue;
  }
}
