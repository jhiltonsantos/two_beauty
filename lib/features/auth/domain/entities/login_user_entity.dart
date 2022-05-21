class LoginUserEntity {
  String refresh;
  String access;

  LoginUserEntity({required this.refresh, required this.access});

  factory LoginUserEntity.fromJson(Map<String, dynamic> json) {
    return LoginUserEntity(
      refresh: json['refresh'],
      access: json['access'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['refresh'] = refresh;
    data['access'] = access;
    return data;
  }

  @override
  String toString() {
    return 'loginUser{refresh: $refresh, access: $access}';
  }
}
