import 'package:pseudo_social_network/model/address.dart';

class User {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;

  User.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        id = json['id'],
        name = json['name'],
        email = json['email'],
        address = Address.fromJson(json['address']),
        phone = json['phone'],
        website = json['website'];
}
