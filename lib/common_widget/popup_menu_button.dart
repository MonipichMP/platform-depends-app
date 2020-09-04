import 'package:flutter/material.dart';

class PopUpMenuButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (_) => <PopupMenuItem<String>>[
        PopupMenuItem(
          child: Text("value 1"),
          value: "value 1",
        ),
        PopupMenuItem(
          child: Text("value 2"),
          value: "value 2",
        ),
      ],
    );
  }
}
