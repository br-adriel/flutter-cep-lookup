import 'package:flutter/material.dart';
import 'package:flutter_cep_lookup/screens/home/tabs/ceps_salvos.dart';
import 'package:flutter_cep_lookup/screens/home/tabs/pesquisar_cep.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Localiza CEP",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Tab(text: "Pesquisar CEP"),
            Tab(
              text: "CEPs Salvos",
            ),
          ]),
        ),
        body: const TabBarView(children: [
          PesquisarCEPTab(),
          CEPsSalvosTab(),
        ]),
      ),
    );
  }
}
