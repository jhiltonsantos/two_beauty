class UserClass {
  String username;
  String email;
  String firstName;
  String password;

  UserClass(
      {required this.username,
      required this.email,
      required this.firstName,
      required this.password});

  factory UserClass.fromJson(Map<String, dynamic> json) {
    return UserClass(
      username: json['username'] as String,
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      password: json['password'] as String,
    );
  }

  get data => null;
}

class UserData {
  int id;
  String username;
  String email;
  String firstName;

  UserData(
      {required this.id,
        required this.username,
        required this.email,
        required this.firstName});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
        id: json['id'] as int,
        username: json['username'] as String,
        email: json['email'] as String,
        firstName: json['first_name'] as String);
  }

  get data => null;
}
