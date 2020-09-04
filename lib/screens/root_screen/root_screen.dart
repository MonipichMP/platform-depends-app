import 'package:flutter/material.dart';
import 'package:platform_depends_app/common_widget/custom_scroll_view.dart';
import 'package:platform_depends_app/screens/root_screen/components/body.dart';

class RootScreen extends StatefulWidget {
  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Platform Depends",
          style: TextStyle(color: Colors.white),
        ),
      ),
      // body: CustomScrollWidget(),
      body: BodyRootScreen(),
    );
  }
}
