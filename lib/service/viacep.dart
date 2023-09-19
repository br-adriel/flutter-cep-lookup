import 'package:dio/dio.dart';
import 'package:flutter_cep_lookup/models/cep.dart';

class ViaCEPService {
  final Dio _dio = Dio();

  Future<CEPModel> getData(String cep) async {
    var res = await _dio.get("https://viacep.com.br/ws/$cep/json/");
    return CEPModel.fromJson(res.data);
  }
}
