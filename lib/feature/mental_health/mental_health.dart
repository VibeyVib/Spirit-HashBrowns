import 'package:flutter/material.dart';
import 'package:spirit/feature/mental_health/custom_toggle_button.dart';
import 'package:spirit/feature/mental_health/mood_board.dart';

class MentalHealth extends StatefulWidget {
  const MentalHealth({Key? key}) : super(key: key);

  @override
  _MentalHealthState createState() => _MentalHealthState();
}

class _MentalHealthState extends State<MentalHealth> {
 String feeling='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffaefeff),
      resizeToAvoidBottomInset: false,
      body: _buildContent(),
    );
  }

  Widget _buildContent(){
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('How are you feeling?',
                style: TextStyle(
                  fontSize: 30.0 * height / 812.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
             SizedBox(height: 100.0,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 CustomToggleButton(title: 'Sad', onPressed: () {
                   setState(() {
                     feeling='Sad';
                   });
                 }, category: feeling),
                 CustomToggleButton(title: 'Angry', onPressed: () {
                   setState(() {
                     feeling='Angry';
                   });
                 }, category: feeling),
                 CustomToggleButton(title: 'Fear', onPressed: () {
                   setState(() {
                     feeling='Fear';
                   });
                 }, category: feeling),
               ],
             ),
              SizedBox(height: 50.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomToggleButton(title: 'Joy', onPressed: () {
                    setState(() {
                      feeling='Joy';
                    });
                  }, category: feeling),
                  CustomToggleButton(title: 'Love', onPressed: () {
                    setState(() {
                      feeling='Love';
                    });
                  }, category: feeling),

                ],
              ),
              SizedBox(height: 100.0,),

      Padding(
        padding: EdgeInsets.only(top: 40.0),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)
          ),
          onPressed: () {
           Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MoodBoard(mood: feeling,)),
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
      )],

      ),
    );
  }
}
