import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spirit/feature/authentication/start_page.dart';
import 'package:spirit/feature/nutrition/nutrientfacts.dart';
import 'src/ui/splash.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Paint.enableDithering=true;
  await Firebase.initializeApp();
  runApp(const MyApp());
}
final nutrientData={
  "CA":{"amount":37.5,"unit":"mg"},
  "CHOCDF":{"amount":342.1,"unit":"mg"},
  "CHOLE":{"amount":16.561,"unit":"mg"},
  "ENERC_KCAL":{"amount":2135.9,"unit":"mg"},
  "FAT":{"amount":67.51,"unit":"g"},
  "CA":{"amount":37.5,"unit":"mg"},
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spirit',
      theme: ThemeData(
        textTheme: GoogleFonts.urbanistTextTheme(),
        primaryColor: Color(0xffAEFEFF),
      ),
      //home: Calendar(),

      //temp:
     home: StartPage(),

    );/*
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nutrition Facts',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Colors.black,
          accentColor: Colors.white,
        ),
        home: Splash());*/
  }
}

