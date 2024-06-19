// import 'package:flutter/material.dart';
// import 'package:flutter_suit_question1_dika/secondscreen.dart';
// import 'package:flutter_suit_question1_dika/thirdscreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'https://reqres.in/api/users';

  static Future<List<dynamic>> tampilkanUser(int page, int perPage) async {
    final response = await http.get(Uri.parse('$baseUrl?page=$page&per_page=$perPage'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else {
      throw Exception('Failed to load users');
    }
  }
}

// class NavigationService {
//   static Future<void> navigateThirdScreen(BuildContext context) async {
//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => third_screen()),
//     );

//     if (result != null) {
//       Navigator.pop(context, result);
//     }
//   }
  
//   static void navigateSecondScreen(BuildContext context, String name){
//     Navigator.push(context, MaterialPageRoute(builder: (context) => second_screen(name: name)),
//     );
//   }
// }