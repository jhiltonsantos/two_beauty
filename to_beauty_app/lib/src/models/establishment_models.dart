class Estabelecimento {
  String nome;
  String cidade;
  String bairro;
  String rua;
  String numero;
  String cep;
  String telefone;
  String latitude;
  String longitude;
  int user;

  Estabelecimento(
      {required this.nome,
      required this.cidade,
      required this.bairro,
      required this.rua,
      required this.numero,
      required this.cep,
      required this.telefone,
      required this.latitude,
      required this.longitude,
      required this.user});

  factory Estabelecimento.fromJson(Map<String, dynamic> json) {
    return Estabelecimento(
      nome: json['nome'] as String,
      cidade: json['cidade'] as String,
      bairro: json['bairro'] as String,
      rua: json['rua'] as String,
      numero: json['numero'] as String,
      cep: json['cep'] as String,
      telefone: json['telefone'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      user: json['user'] as int,
    );
  }
}
