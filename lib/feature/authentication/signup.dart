import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffAEFEFF),

      appBar: AppBar(
        backgroundColor: Color(0xff072227),
        title: Text('Sign Up'),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded), onPressed: () {Navigator.of(context).pop();},),
        actions: [
          SvgPicture.asset('assets/images/spirit.svg',
          height: 80.0,
width: 200.0,
          color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget _buildContent() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset('assets/images/signup.svg',
          height: 230.0,
          ),
          Text("Let's get started on a journey of growth and healing!",
          style: TextStyle(
            //fontWeight: FontWeight.w600,
            fontSize: 18.0,
            color: Color(0xff072227)
          ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(
              ),
              fillColor: Color(0xff072227),
              labelText: 'Email',
              labelStyle: TextStyle(
                color: Color(0xff072227),
              ),

            ),
          ),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(
              ),
              fillColor: Color(0xff072227),
              labelText: 'Password',
              labelStyle: TextStyle(
                color: Color(0xff072227),
              ),

            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Signup()),
              );
            },
            child: Container(
              width: 150.0,
              child: Text('Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
