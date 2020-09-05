import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:platform_depends_app/screens/home_screen/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Placeholder(
                color: Colors.blue,
                fallbackHeight: 200,
                fallbackWidth: 200,
              ),
              SizedBox(height: 20),
              Text("Register Page"),
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
                },
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: onRegister,
                child: Text("Register Now or never"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onRegister() async{
    if (formKey.currentState.validate()) {
      try {
        UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              emailUser: user.user.email,
            ),
          ),
        );
      } on FirebaseAuthException catch (e) {
        print("error on" + e.code);
        print('on exception');
      }
    }
  }
}
