import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _buildContent() {
    return Container();
  }
}
