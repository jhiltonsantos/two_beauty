class UserClass {
  String username;
  String email;
  String first_name;
  String password;

  UserClass(
      {required this.username,
      required this.email,
      required this.first_name,
      required this.password});

  factory UserClass.fromJson(Map<String, dynamic> json) {
    return UserClass(
      username: json['username'] as String,
      email: json['email'] as String,
      first_name: json['first_name'] as String,
      password: json['password'] as String,
    );
  }
}
