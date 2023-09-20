import 'package:flutter/material.dart';

class CEPRemocaoDialog extends StatelessWidget {
  const CEPRemocaoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Excluir CEP?"),
      content: const Text(
        "O CEP não aparecerá mais na lista de CEPs salvos",
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            "Cancelar",
            style: TextStyle(color: Colors.red[600]),
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.red[600]),
          ),
          child: const Text("Remover"),
        ),
      ],
    );
  }
}
