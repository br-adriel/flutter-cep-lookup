import 'package:flutter/material.dart';
import 'package:flutter_cep_lookup/models/cep.dart';

class CEPInfo extends StatelessWidget {
  final CEPModel cep;
  final TextStyle _textStyle = const TextStyle(fontSize: 18);

  const CEPInfo(this.cep, {super.key});

  @override
  Widget build(BuildContext context) {
    if (cep.erro || cep.cep.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          cep.erro
              ? "CEP não encontrado"
              : "Pesquise um CEP para saber mais informações",
          textAlign: TextAlign.center,
          style: _textStyle,
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          "Informações para o CEP ${cep.cep}",
          style: _textStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          "Logradouro: ${cep.logradouro.isEmpty ? '-' : cep.logradouro}",
          style: _textStyle,
        ),
        Text(
          "Complemento: ${cep.complemento.isEmpty ? '-' : cep.complemento}",
          style: _textStyle,
        ),
        Text(
          "Bairro: ${cep.bairro.isEmpty ? '-' : cep.bairro}",
          style: _textStyle,
        ),
        Text(
          "Cidade: ${cep.localidade.isEmpty ? '-' : cep.localidade}",
          style: _textStyle,
        ),
        Text(
          "Estado: ${cep.uf.isEmpty ? '-' : cep.uf}",
          style: _textStyle,
        ),
        Text(
          "DDD: ${cep.ddd.isEmpty ? '-' : cep.ddd}",
          style: _textStyle,
        ),
      ],
    );
  }
}
