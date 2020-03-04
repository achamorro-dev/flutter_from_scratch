import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:whatsapp_redesign/src/models/user_model.dart';

class UsersProvider {

  static Future<List<User>> getUsers() async {
    List<User> list = [];
    
    final response = await http.get('https://randomuser.me/api?results=10');
    Map dataMap = json.decode(response.body);

    dataMap['results'].forEach( (item) {
      list.add(User.fromJson(item));
    });

    return list;
  }
  
}