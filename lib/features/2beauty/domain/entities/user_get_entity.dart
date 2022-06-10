class UserGetEntity {
  int? id;
  String? username;
  String? firstName;
  String? email;

  UserGetEntity({this.id, this.username, this.firstName, this.email});

  UserGetEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['first_name'] = firstName;
    data['email'] = email;
    return data;
  }
}