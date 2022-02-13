import 'package:flutter/material.dart';
import 'package:spirit/feature/chat_bot/dfchatbot_widget.dart';


class Chatbot extends StatelessWidget {
  const Chatbot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        //appBar: CustomAppBar(""),
        body: HomePageDialogflow(),
        //bottomNavigationBar: CustomNavBar2(),
        backgroundColor: Color.fromRGBO(98, 161, 214, 1),

      ),
    );
  }
}








