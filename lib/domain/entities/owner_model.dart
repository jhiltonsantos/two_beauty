class Owner {
  String cpf;
  String birthday;
  String phone;

  Owner({required this.cpf, required this.birthday, required this.phone});

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      cpf: json['cpf'] as String,
      birthday: json['data_nascimento'] as String,
      phone: json['telefone'] as String,
    );
  }
}
