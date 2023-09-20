import 'package:flutter/material.dart';
import 'package:flutter_cep_lookup/models/cep_back4app.dart';

class CEPListTile extends StatelessWidget {
  final CEPBack4AppModel _cep;

  const CEPListTile(this._cep, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:
          Text("${_cep.localidade}${_cep.uf.isNotEmpty ? '/${_cep.uf}' : ''}"),
      subtitle: Text(_cep.cep),
      shape: const Border(bottom: BorderSide(color: Colors.black12, width: 0)),
    );
  }
}
