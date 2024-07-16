import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   List<dynamic> users = [];

     @override
  void initState() {
    super.initState();
    getUsers();
  }

    Future<void> getUsers() async {
    final url = Uri.parse("http://localhost:5300/api/auth/users");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body)["data"];
        print("responseBody get : $responseBody");
        setState(() {
          users = responseBody;
        });
            print("Users : $users");

      } else {
        print('Erreur de requête : ${response.statusCode}');
      }
    } catch (err) {
      print("Error $err");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      body: users.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  margin: const EdgeInsets.symmetric(vertical: 1),
                  decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 69, 152, 219)
                  ),
                  child: ListTile(
                  title: Text(user['email']),
                ),
                );
              },
            ),

    );
  }
}