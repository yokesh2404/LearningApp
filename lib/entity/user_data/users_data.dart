class UsersData {
  dynamic password;
  String? name;
  String? email;

  UsersData({this.password, this.name, this.email});

  UsersData.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    //'new' changes N
    data['password'] = this.password;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}
