import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'google_sheets_api.dart';
import 'package:spirit/feature/authentication/start_page.dart';
import 'package:spirit/feature/budget/google_sheets_api.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Paint.enableDithering=true;
  await Firebase.initializeApp();
  GoogleSheetsApi().init();
  runApp(const MyApp());
}

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

    );
  }
}

