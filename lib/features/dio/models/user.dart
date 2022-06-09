import 'dart:convert';

// User userFromJson(String str) => User.fromJson(json.decode(str));

class User {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;

  User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        email: json['email'],
        firstName: json['first_name'],
        lastName: json['last_name'],
      );

  // fromJson(Map<String, dynamic> json) {
  //   return User(
  //     id: json['id'],
  //     email: json['email'],
  //     firstName: json['first_name'],
  //     lastName: json['last_name'],
  //   );
  // }
}

User fromJson(Map<String, dynamic> json) {
  return User(
    id: int.tryParse(json['id']),
    email: json['email'],
    firstName: json['first_name'],
    lastName: json['last_name'],
  );
}
