import 'package:flutter/material.dart';

class CEPSalvoDialog extends StatelessWidget {
  final String _cep;

  const CEPSalvoDialog(this._cep, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("CEP salvo!"),
      content:
          Text("As informações do CEP $_cep foram salvas no banco de dados"),
      actions: [
        TextButton(
          child: const Text("Ok"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
