import 'package:flutter/material.dart';
import 'package:login_signup/models/user_model.dart';


class DetailPage extends StatefulWidget {
   final User user;
   const DetailPage({super.key, required this.user});
   

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(widget.user.email),),
    );
  }
}