// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;


//     Future<void> getUsers() async {
//     final url = Uri.parse("http://localhost:5300/api/auth/users");

//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final responseBody = jsonDecode(response.body)["data"];
//         print("responseBody get : $responseBody");
//         setState(() {
//           users = responseBody;
//         });
//             print("Users : $users");

//       } else {
//         print('Erreur de requête : ${response.statusCode}');
//       }
//     } catch (err) {
//       print("Error $err");
//     }
//   }

