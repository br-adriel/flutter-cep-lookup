import 'package:flutter/material.dart';
import 'package:flutter_cep_lookup/models/cep_back4app.dart';
import 'package:flutter_cep_lookup/repositories/cep_back4app.dart';

class CEPsSalvosTab extends StatefulWidget {
  const CEPsSalvosTab({super.key});

  @override
  State<CEPsSalvosTab> createState() => _CEPsSalvosTabState();
}

class _CEPsSalvosTabState extends State<CEPsSalvosTab> {
  final CEPBack4AppRepository _repository = CEPBack4AppRepository();
  List<CEPBack4AppModel> _ceps = [];
  bool _loading = false;

  _loadData() async {
    _loading = true;
    setState(() {});

    _ceps = await _repository.listar();

    _loading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());

    if (_ceps.isEmpty) {
      return const Center(
          child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "Nenhum CEP Salvo",
          style: TextStyle(fontSize: 18),
        ),
      ));
    }

    return ListView.builder(
      itemCount: _ceps.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: ListTile(
            title: Text(
                "${_ceps[index].localidade}${_ceps[index].uf.isNotEmpty ? '/${_ceps[index].uf}' : ''}"),
            subtitle: Text(_ceps[index].cep),
            shape: const Border(
              bottom: BorderSide(
                color: Colors.black12,
                width: 0,
              ),
            ),
          ),
        );
      },
    );
  }
}
