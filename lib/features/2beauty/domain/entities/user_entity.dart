class UserEntity {
  String username;
  String email;
  String firstName;
  String password;

  UserEntity(
      {required this.username,
      required this.email,
      required this.firstName,
      required this.password});

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      username: json['username'] as String,
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      password: json['password'] as String,
    );
  }
}
