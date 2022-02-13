import 'package:flutter/material.dart';
import 'package:spirit/src/ui/search_foods.dart';

class GoodNews extends StatefulWidget {
  const GoodNews({Key? key, required this.mood}) : super(key: key);

  final String mood;

  @override
  _GoodNewsState createState() => _GoodNewsState();
}

class _GoodNewsState extends State<GoodNews> {

  List<String> joy=['Young woman delivered VR to isolated senior citizens','Banjo player serenades fox which comes back for an encore', 'Woman races to save the largest and stinkiest corpse flower'];
  List<String> sad=['Man needs friends and makes pancakes so he nervously makes pancakes for dozens of neighbours','80 year old man walks through blizzard to save three people','Mom finds lost cat after recognizing his meow on a phone call'];
  List<String> love=['Bride walks down the aisle, but ring bearer pet tortoise steals the show','Ranchi women try to revive handmade toy industry','Meet the fastest human calculator from Hyderabad'];
  List<String> angry=['Meet the unsung heroes who bury COVID victims','Meet the man who rescues a 100 snakes a month','Assam boy makes art using chinese waste'];
  List<String> fear=['Maoist hit Malkangiri district gets mobile network','Ambala woman turns COVID crisis into opportunity','Delhi is having longest spell of clean air, best in 5 years'];
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color(0xffaefeff),
      resizeToAvoidBottomInset: false,
      body: _buildContent(),
    );
  }
  Widget _buildContent(){
    List<String> news=widget.mood=='Joy'?joy:widget.mood=='Sad'?sad:widget.mood=='Love'?love:widget.mood=='Angry'?angry:fear;
    return Padding(padding: EdgeInsets.all(35.0),
    child: SingleChildScrollView(
      child: Column(
        children: [
          Text('Good News', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22.0),),
SizedBox(height: 15.0,),

          Container(
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Text('${news[0]}', style: TextStyle(
                  color: Colors.black
                ),),
                SizedBox(height: 10.0,),
                Text('Read more', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),)
              ],
            ),
          ),
          SizedBox(height: 20.0,),
          Container(
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.white,
            ),
            child:Column(
              children: [
                Text('${news[1]}', style: TextStyle(
                    color: Colors.black
                ),),
                SizedBox(height: 10.0,),
                Text('Read more', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),)
              ],
            ),
          ),
          SizedBox(height: 20.0,),
          Container(
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Text('${news[2]}', style: TextStyle(
                    color: Colors.black
                ),),
                SizedBox(height: 10.0,),
                Text('Read more', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),)
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}
