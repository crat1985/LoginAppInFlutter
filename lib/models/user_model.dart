class UserModel {
  final String? email;
  final String? password;
  String? uid;

  UserModel({this.uid, this.email, this.password});

  set setUid(String value) => uid = value;

  Map<String, dynamic> toJSON() => {
        "uid": uid,
        "email": email,
        "password": password,
      };
}
