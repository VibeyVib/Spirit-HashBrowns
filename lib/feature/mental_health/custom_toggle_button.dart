import 'package:flutter/material.dart';

class CustomToggleButton extends StatefulWidget {
  final String title;
  final void Function() onPressed;
  final String category;

  const CustomToggleButton({Key? key, required this.title, required this.onPressed, required this.category,  }) : super(key: key);

  @override
  _CustomToggleButtonState createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  double widthButton=65.0;
  double heightButton=30.0;
  @override

  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Container(
      height: heightButton,
      width: widthButton,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6.0)),
        gradient: widget.category!=widget.title ? const LinearGradient(
            colors: [Colors.black, Colors.black]) :const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff072227), Color(0xff35858B), Color(0xff4fbdba)]),
        boxShadow: [ widget.category==widget.title ?
        BoxShadow(
          color: Colors.black.withOpacity(0.7),
          spreadRadius: 2,
          blurRadius: 3,
          offset: const Offset(2,2), // changes position of shadow
        ) :
        BoxShadow(
          color: Colors.black.withOpacity(0.6),
          spreadRadius: 2,
          blurRadius: 3,
          //offset: Offset(0, 3), // changes position of shadow
        ),
        ],
      ),
      child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            minimumSize: MaterialStateProperty.all(Size(widthButton, heightButton)),
            backgroundColor:
            MaterialStateProperty.all(Colors.transparent),
            // elevation: MaterialStateProperty.all(3),
            shadowColor:
            MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () {
            widget.onPressed();
            //setState(() {});
            //print("${widget.gender}");
          },
          child: Center(
            child: Text(widget.title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.0 * height / 812.0,
              ),
              textAlign: TextAlign.center,
            ),
          )
      ),
    );
  }
}
