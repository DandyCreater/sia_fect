class LoginResponseModel {
  bool? error;
  int? id;
  String? username;
  String? nre;
  String? nome;
  int? nudep;
  String? message;
  Status? status;

  LoginResponseModel(
      {this.error,
      this.id,
      this.username,
      this.nre,
      this.nome,
      this.nudep,
      this.message,
      this.status});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    id = json['id'];
    username = json['username'];
    nre = json['nre'];
    nome = json['nome'];
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
    data['nudep'] = this.nudep;
    data['message'] = this.message;
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
