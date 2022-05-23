class LoginGetTokenEntity {
  String username;
  String password;

  LoginGetTokenEntity({required this.username, required this.password});

  factory LoginGetTokenEntity.fromJson(Map<String, dynamic> json) {
    return LoginGetTokenEntity(
      username: json['username'],
      password: json['password'],
    );
  }
}
