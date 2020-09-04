import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:platform_depends_app/screens/home_screen/home_screen.dart';
import 'package:platform_depends_app/screens/root_screen/root_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Placeholder(
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text("Login Page"),
            SizedBox(height: 20),
            TextFormField(
              controller: email,
              decoration: InputDecoration(hintText: 'email'),
              validator: (input) {
                if (input.isEmpty) {
                  return 'Email can\'t be empty';
                }
                if (!input.contains('@')) {
                  return 'Input email wrong pattern';
                }
                return '';
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(hintText: 'password'),
              validator: (input) {
                if (input.isEmpty) {
                  return 'password can\'t be empty';
                }
                if (input.length < 6) {
                  return 'Input password more than 6';
                }
                return '';
              },
            ),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: () => onLogin(),
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onLogin() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      try {
        FirebaseUser user =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              emailUser: user.email,
            ),
          ),
        );
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
