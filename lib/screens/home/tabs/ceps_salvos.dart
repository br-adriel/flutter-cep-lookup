import 'package:flutter/material.dart';
import 'package:flutter_cep_lookup/models/cep_back4app.dart';
import 'package:flutter_cep_lookup/repositories/cep_back4app.dart';
import 'package:flutter_cep_lookup/widgets/cep_list_tile.dart';
import 'package:flutter_cep_lookup/widgets/cep_remocao_dialog.dart';
import 'package:flutter_cep_lookup/widgets/exclusao_dismiss_bg.dart';

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

  _removerCep(String id) async {
    await _repository.remover(id);
    _loadData();
  }

  _confirmDismiss() {
    return showDialog(
      context: context,
      builder: (context) => const CEPRemocaoDialog(),
    );
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
        return Dismissible(
          direction: DismissDirection.endToStart,
          dismissThresholds: const {DismissDirection.endToStart: 0.2},
          onDismissed: (direction) => _removerCep(_ceps[index].objectId),
          confirmDismiss: (direction) => _confirmDismiss(),
          background: const ExclusaoDismissBg(),
          key: Key(_ceps[index].objectId),
          child: InkWell(
            onTap: () {},
            child: CEPListTile(_ceps[index]),
          ),
        );
      },
    );
  }
}
