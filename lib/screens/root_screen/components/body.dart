import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platform_depends_app/common_widget/alert_dialog.dart';
import 'package:platform_depends_app/common_widget/clip_path.dart';
import 'package:platform_depends_app/common_widget/custom_scroll_view.dart';
import 'package:platform_depends_app/common_widget/date_picker.dart';
import 'package:platform_depends_app/common_widget/form_text_field.dart';
import 'package:platform_depends_app/common_widget/popup_menu_button.dart';
import 'package:platform_depends_app/common_widget/stepper.dart';
import 'package:platform_depends_app/screens/login_screen/login_screen.dart';

class BodyRootScreen extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<BodyRootScreen> {
  DateTime datePicked = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView(
        children: [
          ClipPathWidget(),
          RaisedButton(
            onPressed: () => CommonWidget().showDialogWidget(
              context,
              "We\'re about to get your data",
              "Your data we will need for cookies",
              "Ok",
              () {
                Navigator.of(context).pop();
              },
            ),
            child: Text("show Dialog"),
          ),
          SizedBox(height: 15),
          RaisedButton(
            onPressed: () async {
              DateTime date = await DatePicker().onDatePicker(
                context,
                DateTime.now(),
                DateTime(2018),
                DateTime(2030),
              );
              if (date != null) {
                setState(() {
                  datePicked = date;
                });
              }
            },
            child: Text("show date picker"),
          ),
          Text(datePicked.toIso8601String()),
          SizedBox(height: 15),
          FormTextFieldWidget(),
          SizedBox(height: 15),
          PopUpMenuButtonWidget(),
          SizedBox(height: 15),
          RaisedButton(
            onPressed: () => CommonWidget().showSimpleDialog(context),
            child: Text("show Dialog Options"),
          ),
          SizedBox(height: 15),
          Expanded(child: StepperWidget()),
          SizedBox(height: 15),
          RaisedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            ),
            child: Text("Go to login"),
          ),
        ],
      ),
    );
  }
}
