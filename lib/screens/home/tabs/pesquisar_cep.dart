import 'package:flutter/material.dart';
import 'package:flutter_cep_lookup/models/cep.dart';
import 'package:flutter_cep_lookup/service/viacep.dart';

class PesquisarCEPTab extends StatefulWidget {
  const PesquisarCEPTab({super.key});

  @override
  State<PesquisarCEPTab> createState() => _PesquisarCEPTabState();
}

class _PesquisarCEPTabState extends State<PesquisarCEPTab> {
  bool _loading = false;
  CEPModel _cepInfo = CEPModel();
  final ViaCEPService _viacep = ViaCEPService();
  String? _inputError;

  _validarCampo(String value) {
    _inputError = value.length == 8 ? null : "O input deve ter 8 digitos";
    setState(() {});
  }

  Future<void> _getCEP(String value) async {
    _validarCampo(value);
    if (value.length == 8) {
      _loading = true;
      _cepInfo = CEPModel();
      setState(() {});

      _cepInfo = await _viacep.getData(value);

      _loading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: _loading
                ? const CircularProgressIndicator()
                : _cepInfo.cep.isEmpty
                    ? const Text("Pesquise um CEP para saber mais informações")
                    : ListView(
                        padding: const EdgeInsets.all(16),
                        children: [
                          Text("Logradouro: ${_cepInfo.logradouro}"),
                          Text("Complemento: ${_cepInfo.complemento}"),
                          Text("Bairro: ${_cepInfo.bairro}"),
                          Text("Cidade: ${_cepInfo.localidade}"),
                          Text("Estado: ${_cepInfo.uf}"),
                          Text("DDD: ${_cepInfo.ddd}"),
                        ],
                      ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: TextField(
            textInputAction: TextInputAction.search,
            decoration:
                InputDecoration(labelText: "CEP", errorText: _inputError),
            keyboardType: TextInputType.number,
            onSubmitted: (value) => _getCEP(value),
            onChanged: (value) {
              if (_cepInfo.cep != "") {
                _cepInfo = CEPModel();
                setState(() {});
              }
              if (value.length >= 8) {
                _validarCampo(value);
              }
            },
          ),
        ),
      ],
    );
  }
}
