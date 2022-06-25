import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String type;
  final String token;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.type,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'type': type,
      'token': token,
    };
  }

  // {
  // "name": "Alex",
  // "email": "hashed@test.io",
  // "password": "$2a$08$760fhSZuB0ilIRhwlc6bc.PjW/6ZGayosO2JjicU8uwkmdFEfNhPO",
  // "address": "",
  // "type": "user",
  // "_id": "62b716046ffd9bd4ebdf9259",
  // "__v": 0
  // }
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      // _id is a mongodb generated id
      id: map['_id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      address: map['address'] as String,
      type: map['type'] as String,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
