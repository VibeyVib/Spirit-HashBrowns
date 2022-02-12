import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTab extends StatefulWidget {
  const CustomTab({Key? key, required this.title, required this.icon, required this.description, required this.child}) : super(key: key);

  final String title;
  final String icon;
  final String description;
  final void Function() child;

  @override
  _CustomTabState createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.0,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.white,
          ),
          child: Padding(padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 125.0,
                  child: Column(
                   children: [
                     Text(widget.title, style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w700,),),
                     SizedBox(height: 10.0,),
                     Text(widget.description, style: TextStyle(fontSize: 14.0, color: Colors.black),),
                     SizedBox(height: 10.0,),
                     TextButton(onPressed: widget.child, child: Text('Try', style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w600),))
                   ],
                  ),
                ),
                SizedBox(width: 10.0,),
                SvgPicture.asset(widget.icon, width: 80.0,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
