import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_signup/pages/home_page.dart';



Future<void> registerUser(String email, String password, context) async {
    final url = Uri.parse('http://localhost:5300/api/auth/signup'); // URL de votre backend

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      print("response data :  $response");

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
      print("responseBody data :  $responseBody");

        if (responseBody['status'] == true) {
          // Enregistrement réussi
          print('Utilisateur enregistré avec succès : ${responseBody['user']}');


           Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else {
          // Erreur côté serveur
          print('Erreur : ${responseBody['message']}');
        }
      } else {
        // Erreur de requête HTTP
        print('Erreur de requête : ${response.statusCode}');
      }
    } catch (e) {
      print('Erreur : $e');
    }
  }