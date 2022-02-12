import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spirit/feature/authentication/signin_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SignInBloc _signInBloc=SignInBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffAEFEFF),

      appBar: AppBar(
        backgroundColor: Color(0xff072227),
        title: Text('Home'),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded), onPressed: () {Navigator.of(context).pop();},),
        actions: [
          SvgPicture.asset('assets/images/spirit.svg',
            height: 80.0,
            width: 200.0,
            color: Colors.white,
          ),
          IconButton(onPressed: () {
            _signInBloc.signOut(context);
          }, icon: Icon(Icons.close, color: Colors.red,))
        ],
      ),
    );
  }

  _buildContent() {

  }
}
