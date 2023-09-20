import 'package:dio/dio.dart';
import 'package:flutter_cep_lookup/models/cep_back4app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CEPBack4AppRepository {
  final Dio _dio = Dio();

  CEPBack4AppRepository() {
    _dio.options.headers["X-Parse-Application-Id"] =
        dotenv.env['BACK4APP_APP_ID'];
    _dio.options.headers["X-Parse-REST-API-Key"] =
        dotenv.env['BACK4APP_API_KEY'];
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.baseUrl = "https://parseapi.back4app.com";
  }

  Future<List<CEPBack4AppModel>> listar() async {
    var res = await _dio.get("/classes/CEP");
    var ceps = CEPsBack4AppModel.fromJson(res.data).ceps;
    return ceps;
  }

  Future<void> adicionar(CEPBack4AppModel cep) async {
    var res = await _dio.get("/classes/CEP?where={\"cep\":\"${cep.cep}\"}");
    var fetchedCeps = CEPsBack4AppModel.fromJson(res.data);
    if (fetchedCeps.ceps.isEmpty) {
      await _dio.post("/classes/CEP", data: cep.toJsonData());
    }
  }

  Future<void> remover(String id) async {
    await _dio.delete("/classes/CEP/$id");
  }
}
