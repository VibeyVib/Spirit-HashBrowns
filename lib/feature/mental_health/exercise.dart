import 'package:flutter/material.dart';
import 'package:spirit/src/ui/search_foods.dart';

class Exercise extends StatefulWidget {
  const Exercise({Key? key, required this.mood}) : super(key: key);

  final String mood;

  @override
  _ExerciseState createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {

  List<String> joy=['Young woman delivered VR to isolated senior citizens','Banjo player serenades fox which comes back for an encore', 'Woman races to save the largest and stinkiest corpse flower'];
  List<String> sad=['Urdhva Hastasana: Stand in Mountain Pose at the front of your mat. Inhale, reaching your arms overhead to Upward Salute.','Uttanasana: Exhale, folding forward into a Standing Forward Bend.','Adho Mukha Svanasana: Exhale, pull your hips back to Downward-Facing Dog.'];
  List<String> love=['Bride walks down the aisle, but ring bearer pet tortoise steals the show','Ranchi women try to revive handmade toy industry','Meet the fastest human calculator from Hyderabad'];
  List<String> angry=['Sukhasana: open your palms and stretch your arms overhead','Ustrasana: Begin in a kneeling position with your hips stacked over your knees','Parivrtta Anjaneyasana: Start in Low Crescent Lunge Pose with your right foot forward.'];
  List<String> fear=['Hero pose: This seated posture can help you find your center. Focusing on your breath may help you find ease in the stillness of this pose.','Tree pose: This classic standing pose may help you focus inward, quieting racing thoughts.','Triangle pose: This energizing pose can help ease tension in your neck and back.'];

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
            Text('Exercise', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22.0),),
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
                  Text('Try', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),)
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
                  Text('Try', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),)
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
                  Text('Try', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
