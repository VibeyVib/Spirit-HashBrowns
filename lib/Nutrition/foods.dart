import 'package:flutter/material.dart';

class Food extends StatefulWidget {
  const Food({Key? key}) : super(key: key);

  @override
  _FoodState createState() => _FoodState();
}

Map<String, Map> Foods = {
  "Greek Salad": {"Calories":200,"Fat":"61%", "Carbs":"13%","Protein":"26%"},
  "Burger": {"Calories":295,"Fat":"10.01g", "Carbs":"30.3g","Protein":"13.3g  ","Alt":"Beetroot Burger"},
  "Pizza":{"Calories":400,"Fat":"10g", "Carbs":"36g","Protein":"12g", "Alt":"Mixed Nuts"},
  "Cookies":{"Calories":600,"Fat":"7g", "Carbs":"25g","Protein":"1g", "Alt":"Oatmeal"},
  "Raisin Oatmeal": {"Calories":150,"Fat":"2g", "Carbs":"32g","Protein":"4g"},
  "Paneer Masala": {"Calories":226,"Fat":"25.6g", "Carbs":"9.5g","Protein":"8.5g","Alt":"Vegetable Kurma"},
  "Chocolate Cake": {"Calories":506,"Fat":"22.6g", "Carbs":"75.3g","Protein":"5.7g","Alt":"banana Walnut Bread"},
  "Veg Sandwich": {"Calories":266,"Fat":"8.7g", "Carbs":"41.2g","Protein":"5.8g"},
  "Greek Yoghurt":{"Calories":146,"Fat":"3.8g", "Carbs":"7.8g","Protein":"20g"},
  "Taco":{"Calories":210,"Fat":"9.9g", "Carbs":"21g","Protein":"9.4g"}
};

class _FoodState extends State<Food> {
  @override
  Widget build(BuildContext context) {
    return (
          MyCustomForm());


  }
}
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(

                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text(myController.text),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}
