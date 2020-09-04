import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String emailUser;

  const HomeScreen({Key key, this.emailUser}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(emailUser),
      ),
    );
  }
}
