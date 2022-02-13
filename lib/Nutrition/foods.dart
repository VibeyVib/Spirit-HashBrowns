import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Food extends StatefulWidget {
  const Food({Key? key}) : super(key: key);

  @override
  _FoodState createState() => _FoodState();
}

Map<String, Map> Foods = {
  "Greek Salad": {"Calories":200,"Fat":"61%", "Carbs":"13%","Protein":"26%", "Recipe":"https://www.loveandlemons.com/greek-salad/",},
  "Burger": {"Calories":295,"Fat":"10.01g", "Carbs":"30.3g","Protein":"13.3g  ","Alt":"Beetroot Burger", "AltLink":"https://zoma.to/order/19362836","Recipe":"https://www.cookrepublic.com/beetroot-quinoa-burger-vegan/",},
  "Potato Chips":{"Calories":293,"Fat":"14.5g", "Carbs":"36.6g","Protein":"4.1g", "Alt":"Kale Chips", "Recipe":"https://www.allrecipes.com/recipe/176957/baked-kale-chips/",},
  "Choco Chip Cookies":{"Calories":600,"Fat":"7g", "Carbs":"25g","Protein":"1g", "Alt":"Oatmeal Cookies", "AltLink":"https://zoma.to/order/18877799", "Recipe":"https://www.vegrecipesofindia.com/oatmeal-cookies-recipe/",},
  "Raisin Oatmeal": {"Calories":150,"Fat":"2g", "Carbs":"32g","Protein":"4g", "Recipe":"https://www.food.com/recipe/raisin-oatmeal-with-spices-50592",},
  "Paneer Masala": {"Calories":226,"Fat":"25.6g", "Carbs":"9.5g","Protein":"8.5g","Alt":"Vegetable Kurma","AltLink":" https://zoma.to/order/52043", "Recipe":"https://www.indianhealthyrecipes.com/veg-kurma-recipe-vegetable-korma-recipe/"},
  "Chocolate Cake": {"Calories":506,"Fat":"22.6g", "Carbs":"75.3g","Protein":"5.7g","Alt":"banana Walnut Bread","AltLink":" https://zoma.to/order/19900234", "Recipe":"https://www.foodnetwork.com/recipes/food-network-kitchen/banana-walnut-bread-recipe-2011439"},
  "Veg Sandwich": {"Calories":266,"Fat":"8.7g", "Carbs":"41.2g","Protein":"5.8g","Recipe":"https://www.indianhealthyrecipes.com/veg-sandwich-recipe-vegetable-sandwich/"},
  "Greek Yoghurt":{"Calories":146,"Fat":"3.8g", "Carb"
      "s":"7.8g","Protein":"20g", "Recipe":"https://www.liveeatlearn.com/greek-yogurt/"},
};

class _FoodState extends State<Food> {
  String item='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffaefeff),
      resizeToAvoidBottomInset: false,
      body: _buildContent(),
    );



  }
  Widget _buildContent(){
    return Padding(padding: EdgeInsets.all(35.0),
    child: Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Enter food you wish to eat',
            labelStyle: TextStyle(color: Colors.black)
          ),
          onFieldSubmitted: (String text){
            setState(() {
              item=text;
            });
          },
        ),
        (Foods.containsKey(item))?Column(
          children: [
            SizedBox(height: 20.0,),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0),),
                color: Colors.black,
              ),
              child: Column(
                children: [
                  Text('Calories: ${Foods[item]!['Calories']}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  ),
                  SizedBox(height: 10.0,),
                  Text('Fat: ${Foods[item]!['Fat']}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text('Carbs: ${Foods[item]!['Carbs']}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text('Protein: ${Foods[item]!['Protein']}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 20.0,),
            (Foods[item]!.containsKey('Alt')) ? Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0),),
                    color: Colors.green,
                  ),
                  child: Column(
                    children: [
                      Text("HEALTHY Alternative: ${Foods[item]!['Alt']}", style: TextStyle(color: Colors.black),),
                      SizedBox(height: 10.0,),
                      TextButton(
                        child: Text('Click to Order now', style: TextStyle(color: Colors.black),),
                        onPressed: (){
                          _launchURLBrowser(Foods[item]!['AltLink'] as String);
                        },
                      ),
                      SizedBox(height: 10.0,),
                      TextButton(
                        child: Text('Click to Try recipe', style: TextStyle(color: Colors.black),),
                        onPressed: (){
                          _launchURLBrowser(Foods[item]!['Recipe'] as String);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ) : Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0),),
                    color: Colors.green,
                  ),
                  child: Text("Healthy Choice!", style: TextStyle(color: Colors.black),),
                ),
                SizedBox(height: 20.0,),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0),),
                    color: Colors.indigo,
                  ),
                  child: TextButton(
                    onPressed: () {
                      //print(Foods[item]);
                      _launchURLBrowser(Foods[item]!['Recipe'] as String);
                    },
                    child: Text('Click to Try Recipe', style: TextStyle(color: Colors.orangeAccent),),
                  ),
                ),
              ],
            )
          ],
        ) : Container(),
      ],
    ),
    );
  }
  _launchURLBrowser(String url) async {

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

