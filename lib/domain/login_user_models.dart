class LoginUser {
  String refresh;
  String access;

  LoginUser({required this.refresh, required this.access});

  factory LoginUser.fromJson(Map<String, dynamic> json) {
    return LoginUser(
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
