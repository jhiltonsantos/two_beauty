class UserDataEntity {
  int id;
  String username;
  String email;
  String firstName;

  UserDataEntity(
      {required this.id,
      required this.username,
      required this.email,
      required this.firstName});

  factory UserDataEntity.fromJson(Map<String, dynamic> json) {
    return UserDataEntity(
        id: json['id'] as int,
        username: json['username'] as String,
        email: json['email'] as String,
        firstName: json['first_name'] as String);
  }
}
