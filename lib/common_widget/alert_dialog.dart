import 'package:flutter/material.dart';

class CommonWidget {
  showDialogWidget(
    BuildContext context,
    String title,
    String content,
    String buttonTitle,
    Function onTap,
  ) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: [Text(content)],
            ),
          ),
          actions: [
            FlatButton(
              onPressed: onTap,
              child: Text(buttonTitle),
            ),
          ],
        );
      },
    );
  }

  showSimpleDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return SimpleDialog(
          title: Text("select what you select"),
          children: [
            SimpleDialogOption(
              child: Text("Blur(TM)"),
              onPressed: (){
                Navigator.pop(context, "Blur(TM)");
              },
            ),
            SimpleDialogOption(
              child: Text("CSGO"),
              onPressed: (){
                Navigator.pop(context, "CSGO");
              },
            ),
            SimpleDialogOption(
              child: Text("MLBB"),
              onPressed: (){
                Navigator.pop(context, "MLBB");
              },
            ),
          ],
        );
      },
    );
  }
}
