class OwnerEntity {
  String cpf;
  String birthday;
  String phone;

  OwnerEntity({required this.cpf, required this.birthday, required this.phone});

  factory OwnerEntity.fromJson(Map<String, dynamic> json) {
    return OwnerEntity(
      cpf: json['cpf'] as String,
      birthday: json['data_nascimento'] as String,
      phone: json['telefone'] as String,
    );
  }
}
