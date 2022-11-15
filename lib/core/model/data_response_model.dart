class DataResponseModel {
  Status? status;
  Welcome? welcome;
  List<Mediafre>? mediafre;
  List<Mediaipc>? mediaipc;
  List<Transcript>? transcript;

  DataResponseModel(
      {this.status,
      this.welcome,
      this.mediafre,
      this.mediaipc,
      this.transcript});

  DataResponseModel.fromJson(Map<String, dynamic> json) {
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    welcome =
        json['welcome'] != null ? new Welcome.fromJson(json['welcome']) : null;
    if (json['mediafre'] != null) {
      mediafre = <Mediafre>[];
      json['mediafre'].forEach((v) {
        mediafre!.add(new Mediafre.fromJson(v));
      });
    }
    if (json['mediaipc'] != null) {
      mediaipc = <Mediaipc>[];
      json['mediaipc'].forEach((v) {
        mediaipc!.add(new Mediaipc.fromJson(v));
      });
    }
    if (json['transcript'] != null) {
      transcript = <Transcript>[];
      json['transcript'].forEach((v) {
        transcript!.add(new Transcript.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.welcome != null) {
      data['welcome'] = this.welcome!.toJson();
    }
    if (this.mediafre != null) {
      data['mediafre'] = this.mediafre!.map((v) => v.toJson()).toList();
    }
    if (this.mediaipc != null) {
      data['mediaipc'] = this.mediaipc!.map((v) => v.toJson()).toList();
    }
    if (this.transcript != null) {
      data['transcript'] = this.transcript!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Status {
  bool? error;

  Status({this.error});

  Status.fromJson(Map<String, dynamic> json) {
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    return data;
  }
}

class Welcome {
  String? twelcome;

  Welcome({this.twelcome});

  Welcome.fromJson(Map<String, dynamic> json) {
    twelcome = json['twelcome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['twelcome'] = this.twelcome;
    return data;
  }
}

class Mediafre {
  String? tinan;
  String? tipo;
  dynamic credfre;
  dynamic graufre;
  dynamic totmediafre;
  String? ip;
  List<Fre>? fre;

  Mediafre(
      {this.tinan,
      this.tipo,
      this.credfre,
      this.graufre,
      this.totmediafre,
      this.ip,
      this.fre});

  Mediafre.fromJson(Map<String, dynamic> json) {
    tinan = json['tinan'];
    tipo = json['tipo'];
    credfre = json['credfre'];
    graufre = json['graufre'];
    totmediafre = json['totmediafre'];
    ip = json['ip'];
    if (json['fre'] != null) {
      fre = <Fre>[];
      json['fre'].forEach((v) {
        fre!.add(new Fre.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tinan'] = this.tinan;
    data['tipo'] = this.tipo;
    data['credfre'] = this.credfre;
    data['graufre'] = this.graufre;
    data['totmediafre'] = this.totmediafre;
    data['ip'] = this.ip;
    if (this.fre != null) {
      data['fre'] = this.fre!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Fre {
  dynamic nu;
  String? nudisc;
  String? sigla;
  String? nomedisc;
  String? credito;
  String? numero;
  String? letra;

  Fre(
      {this.nu,
      this.nudisc,
      this.sigla,
      this.nomedisc,
      this.credito,
      this.numero,
      this.letra});

  Fre.fromJson(Map<String, dynamic> json) {
    nu = json['nu'];
    nudisc = json['nudisc'];
    sigla = json['sigla'];
    nomedisc = json['nomedisc'];
    credito = json['credito'];
    numero = json['numero'];
    letra = json['letra'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nu'] = this.nu;
    data['nudisc'] = this.nudisc;
    data['sigla'] = this.sigla;
    data['nomedisc'] = this.nomedisc;
    data['credito'] = this.credito;
    data['numero'] = this.numero;
    data['letra'] = this.letra;
    return data;
  }
}

class Mediaipc {
  String? cred;
  dynamic grau;
  String? totmedia;
  String? ipk;

  Mediaipc({this.cred, this.grau, this.totmedia, this.ipk});

  Mediaipc.fromJson(Map<String, dynamic> json) {
    cred = json['cred'];
    grau = json['grau'];
    totmedia = json['totmedia'];
    ipk = json['ipk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cred'] = this.cred;
    data['grau'] = this.grau;
    data['totmedia'] = this.totmedia;
    data['ipk'] = this.ipk;
    return data;
  }
}

class Transcript {
  dynamic nu;
  String? nudisc;
  String? sigla;
  String? nomedisc;
  String? credito;
  String? numero;
  String? letra;

  Transcript(
      {this.nu,
      this.nudisc,
      this.sigla,
      this.nomedisc,
      this.credito,
      this.numero,
      this.letra});

  Transcript.fromJson(Map<String, dynamic> json) {
    nu = json['nu'];
    nudisc = json['nudisc'];
    sigla = json['sigla'];
    nomedisc = json['nomedisc'];
    credito = json['credito'];
    numero = json['numero'];
    letra = json['letra'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nu'] = this.nu;
    data['nudisc'] = this.nudisc;
    data['sigla'] = this.sigla;
    data['nomedisc'] = this.nomedisc;
    data['credito'] = this.credito;
    data['numero'] = this.numero;
    data['letra'] = this.letra;
    return data;
  }
}
