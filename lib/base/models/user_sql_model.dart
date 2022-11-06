/// id : 0
/// email : "email@email.com"

class UserSqlModel {
  String? email;

  UserSqlModel({
    this.email,
  });

  UserSqlModel.fromJson(dynamic json) {
    email = json['email'];
  }


  UserSqlModel copyWith({
    String? email,
  }) =>
      UserSqlModel(
        email: email ?? this.email,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    return map;
  }
}
