import 'package:flutter/material.dart';

class FormTextFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter some text";
                }
                if (!value.contains("@")){
                  return "Please enter right format";
                }
                return null;
              },
            ),
            RaisedButton(
              onPressed: () {
                if (formKey.currentState.validate()) {}
              },
              child: Text("submit"),
            ),
          ],
        ),
      ),
    );
  }
}
