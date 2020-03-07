// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

class UserResponse {
  List<User> users;

  UserResponse({
    this.users,
  });

  factory UserResponse.fromRawJson(String str) =>
      UserResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}

class User {
  String id;
  bool isActive;
  String balance;
  String picture;
  int age;
  String name;
  String gender;
  String company;
  String email;

  User({
    this.id,
    this.isActive,
    this.balance,
    this.picture,
    this.age,
    this.name,
    this.gender,
    this.company,
    this.email,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        isActive: json["isActive"],
        balance: json["balance"],
        picture: json["picture"],
        age: json["age"],
        name: json["name"],
        gender: json["gender"],
        company: json["company"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "isActive": isActive,
        "balance": balance,
        "picture": picture,
        "age": age,
        "name": name,
        "gender": gender,
        "company": company,
        "email": email,
      };
}
