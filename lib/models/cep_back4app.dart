class CEPsBack4AppModel {
  List<CEPBack4AppModel> ceps = [];

  CEPsBack4AppModel({this.ceps = const []});

  CEPsBack4AppModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      ceps = <CEPBack4AppModel>[];
      json['results'].forEach((v) {
        ceps.add(CEPBack4AppModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = ceps.map((v) => v.toJson()).toList();
    return data;
  }
}

class CEPBack4AppModel {
  String objectId = "";
  String createdAt = "";
  String updatedAt = "";
  String cep = "";
  String logradouro = "";
  String complemento = "";
  String bairro = "";
  String localidade = "";
  String uf = "";
  String ddd = "";

  CEPBack4AppModel({
    this.objectId = "",
    this.createdAt = "",
    this.updatedAt = "",
    this.cep = "",
    this.logradouro = "",
    this.complemento = "",
    this.bairro = "",
    this.localidade = "",
    this.uf = "",
    this.ddd = "",
  });

  CEPBack4AppModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    cep = json['cep'];
    logradouro = json['logradouro'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
    ddd = json['ddd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['cep'] = cep;
    data['logradouro'] = logradouro;
    data['complemento'] = complemento;
    data['bairro'] = bairro;
    data['localidade'] = localidade;
    data['uf'] = uf;
    data['ddd'] = ddd;
    return data;
  }
}
