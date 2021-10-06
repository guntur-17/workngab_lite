class UserModel {
  int? id;
  String? nik;
  String? name;
  String? email;
  String? username;
  String? password;
  String? gender;
  String? photo;
  String? token;

  UserModel(
      {this.id,
      this.nik,
      this.name,
      this.email,
      this.username,
      this.password,
      this.gender,
      this.photo,
      this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nik = json['nik'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    gender = json['gender'];
    photo = json['photo'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nik': nik,
      'name': name,
      'email': email,
      'username': username,
      'password': password,
      'gender': gender,
      'photo': photo,
      'token': token,
    };
  }
}
