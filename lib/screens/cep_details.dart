import 'package:flutter/material.dart';
import 'package:flutter_cep_lookup/models/cep_back4app.dart';
import 'package:flutter_cep_lookup/widgets/cep_info_textfield.dart';

class CEPDetailsScreen extends StatelessWidget {
  final CEPBack4AppModel _cep;

  const CEPDetailsScreen(this._cep, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CEP ${_cep.cep}")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CEPInfoTextField("Logradouro", _cep.logradouro),
          const SizedBox(height: 16),
          CEPInfoTextField("Complemento", _cep.complemento),
          const SizedBox(height: 16),
          CEPInfoTextField("Bairro", _cep.bairro),
          const SizedBox(height: 16),
          CEPInfoTextField("Cidade", _cep.localidade),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: 10,
                  child: CEPInfoTextField("Estado", _cep.uf),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  width: 10,
                  child: CEPInfoTextField("DDD", _cep.ddd),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
