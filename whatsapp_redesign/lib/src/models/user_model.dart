import 'dart:convert';

import 'dart:math';

class User {

  String uuid;
  String firstName;
  String lastName;
  String email;
  String phone;
  String picture;
  bool isConnected;
  bool hasStatus;
  String dummyMessage;

  User({
    this.uuid,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.picture,
    this.isConnected,
    this.hasStatus,
    this.dummyMessage,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
      uuid: json['login']['uuid'],
      firstName: json['name']['first'],
      lastName: json['name']['last'],
      email: json['email'],
      phone: json['phone'],
      picture: json['picture']['large'],
      isConnected: _randomBool(),
      hasStatus: _randomBool(),
      dummyMessage: '',
  );

  Map<String, dynamic> toJson() => {
      'uuid': uuid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'picture': picture,
      'isConnected': isConnected,
      'hasStatus': hasStatus,
      'dummyMessage': dummyMessage,
  };
}

bool _randomBool() => Random().nextInt(2) == 0 ? false : true;

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
