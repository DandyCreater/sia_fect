class LoginResponseModel {
  bool? error;
  int? id;
  String? username;
  String? nre;
  String? nome;
  int? tinanEstudo;
  String? lugarNasc;
  String? dataNasc;
  String? sexo;
  String? endereso;
  String? nuTelemovel;
  String? email;
  String? foto;
  int? nudep;
  String? message;
  Status? status;

  LoginResponseModel(
      {this.error,
      this.id,
      this.username,
      this.nre,
      this.nome,
      this.tinanEstudo,
      this.lugarNasc,
      this.dataNasc,
      this.sexo,
      this.endereso,
      this.nuTelemovel,
      this.email,
      this.foto,
      this.nudep,
      this.message,
      this.status});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    id = json['id'];
    username = json['username'];
    nre = json['nre'];
    nome = json['nome'];
    tinanEstudo = json['Tinan_estudo'];
    lugarNasc = json['lugar_nasc'];
    dataNasc = json['data_nasc'];
    sexo = json['sexo'];
    endereso = json['Endereso'];
    nuTelemovel = json['nu_telemovel'];
    email = json['Email'];
    foto = json['foto'];
    nudep = json['nudep'];
    message = json['message'];
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['id'] = this.id;
    data['username'] = this.username;
    data['nre'] = this.nre;
    data['nome'] = this.nome;
    data['Tinan_estudo'] = this.tinanEstudo;
    data['lugar_nasc'] = this.lugarNasc;
    data['data_nasc'] = this.dataNasc;
    data['sexo'] = this.sexo;
    data['Endereso'] = this.endereso;
    data['nu_telemovel'] = this.nuTelemovel;
    data['Email'] = this.email;
    data['foto'] = this.foto;
    data['nudep'] = this.nudep;
    return data;
  }
}

class Status {
  bool? error;
  String? message;

  Status({this.error, this.message});

  Status.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}
