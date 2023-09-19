class CEPModel {
  String cep = "";
  String logradouro = "";
  String complemento = "";
  String bairro = "";
  String localidade = "";
  String uf = "";
  String ibge = "";
  String gia = "";
  String ddd = "";
  String siafi = "";
  bool erro = false;

  CEPModel(
      {this.cep = "",
      this.logradouro = "",
      this.complemento = "",
      this.bairro = "",
      this.localidade = "",
      this.uf = "",
      this.ibge = "",
      this.gia = "",
      this.ddd = "",
      this.siafi = "",
      this.erro = false});

  CEPModel.fromJson(Map<String, dynamic> json) {
    if (json['erro'] != null) {
      erro = true;
      return;
    }
    cep = json['cep'];
    logradouro = json['logradouro'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
    ibge = json['ibge'];
    gia = json['gia'];
    ddd = json['ddd'];
    siafi = json['siafi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cep'] = cep;
    data['logradouro'] = logradouro;
    data['complemento'] = complemento;
    data['bairro'] = bairro;
    data['localidade'] = localidade;
    data['uf'] = uf;
    data['ibge'] = ibge;
    data['gia'] = gia;
    data['ddd'] = ddd;
    data['siafi'] = siafi;
    return data;
  }
}
