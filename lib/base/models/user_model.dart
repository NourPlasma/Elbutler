/// name : "Taha jemmali"
/// avatar : null
/// id : "1"
/// email : "taha@gmail.com"
/// password : null
/// description : "Hello ! ! ! hear i am"
/// location : [""]

class UserModel {
  UserModel({
      this.name, 
      this.avatar, 
      this.id, 
      this.email, 
      this.password, 
      this.description, 
      this.location,});

  UserModel.fromJson(dynamic json) {
    name = json['name'];
    avatar = json['avatar'];
    id = json['id'];
    email = json['email'];
    password = json['password'];
    description = json['description'];
    location = json['location'];
  }
  String? name;
  dynamic avatar;
  String? id;
  String? email;
  dynamic password;
  String? description;
  dynamic location;

UserModel copyWith({  String? name,
  dynamic avatar,
  String? id,
  String? email,
  dynamic password,
  String? description,
  List<String>? location,
}) => UserModel(  name: name ?? this.name,
  avatar: avatar ?? this.avatar,
  id: id ?? this.id,
  email: email ?? this.email,
  password: password ?? this.password,
  description: description ?? this.description,
  location: location ?? this.location,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['avatar'] = avatar;
    map['id'] = id;
    map['email'] = email;
    map['password'] = password;
    map['description'] = description;
    map['location'] = location;
    return map;
  }

}