import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spirit/feature/authentication/signin_bloc.dart';
import 'package:spirit/feature/budget/budget.dart';
import 'package:spirit/Nutrition/foods.dart';
import 'package:spirit/feature/chat_bot/chatbot.dart';
import 'package:spirit/feature/mental_health/mental_health.dart';
import 'package:spirit/feature/nutrition/nutrition.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SignInBloc _signInBloc=SignInBloc();
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
   MentalHealth(),
    Food(),
    Budget(),
    Chatbot()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
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
      //body: Center(),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 30,
                  child: SvgPicture.asset(
                    "assets/images/mental_health_icon.svg",
                    color: Colors.white,
                  ),
                ),
               label: 'Mental Health',
                backgroundColor: Colors.black
            ),
            BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 30,
                  child: SvgPicture.asset(
                    "assets/images/nutrition_icon.svg",
                    color: Colors.white,
                  ),
                ),
                label: 'Nutrition',
                backgroundColor: Colors.black
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 30,
                height: 30,
                child: SvgPicture.asset(
                  "assets/images/budget_icon.svg",
                  color: Colors.white,
                ),
              ),
              label: 'Budget',
                backgroundColor: Colors.black
            ),
            BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 30,
                  child: Icon(Icons.chat_outlined, color: Colors.white, size: 30.0,)
                ),
                label: 'Chat Bot',
                backgroundColor: Colors.black
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5
      ),

    );
  }

Widget  _buildContent() {
return Center(
  child: _widgetOptions.elementAt(_selectedIndex),
);
  }
}
