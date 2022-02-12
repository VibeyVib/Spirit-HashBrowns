import 'package:spirit/src/models/fat.dart';
import 'package:spirit/src/models/trans_fat.dart';

import 'label_nutrients.dart';

class Food {
  int fdcId=0;
  String description="";
  String lowercaseDescription="";
  double score=0.0;
  //String publicationDate="";
  String dataType="";
  String? foodClass="";
  String?modifiedDate="";
  String? availableDate="";
  String brandOwner="";
  String dataSource="";
  String brandedFoodCategory="";
  String gtinUpc="";
  String householdServingFullText="";
  String ingredients="";
  String marketCountry="";
  double servingSize=0.0;
  String servingSizeUnit="";
  LabelNutrients? labelNutrients=LabelNutrients(fat: Fat(value: 0), saturatedFat: Fat(value: 0), transFat: TransFat(value: 0), cholesterol: TransFat(value: 0), sodium: TransFat(value: 0), carbohydrates: Fat(value: 0) ,fiber: Fat(value: 0), sugars: Fat(value: 0), protein: Fat(value: 0), calcium: Fat(value: 0), iron: Fat(value: 0), potassium: Fat(value: 0), calories: TransFat(value: 0));

  Food(
      {required this.fdcId,
      required this.description,
      required this.lowercaseDescription,
      required this.score,
      //required this.publicationDate,
      required this.dataType,
      required this.foodClass,
      required this.modifiedDate,
      required this.availableDate,
      required this.brandOwner,
      required this.dataSource,
      required this.brandedFoodCategory,
      required this.gtinUpc,
      required this.householdServingFullText,
      required this.ingredients,
      required this.marketCountry,
      required this.servingSize,
      required this.servingSizeUnit,
      this.labelNutrients});

  Food.fromJson(Map<String, dynamic> json) {
    fdcId = json['fdcId']??0;
    description = json['description']??"";
    lowercaseDescription = json['lowercaseDescription']??"";
    score = json['score']??0.0;
    //publicationDate = json['publicationDate'];
    dataType = json['dataType']??"";
    foodClass = json['foodClass']??"";
    modifiedDate = json['modifiedDate']??"";
    availableDate = json['availableDate']??"";
    brandOwner = json['brandOwner']??"";
    dataSource = json['dataSource']??"";
    brandedFoodCategory = json['brandedFoodCategory']??"";
    gtinUpc = json['gtinUpc']??"";
    householdServingFullText = json['householdServingFullText']??"";
    ingredients = json['ingredients']??"";
    marketCountry = json['marketCountry']??"";
    servingSize = json['servingSize']??0.0;
    servingSizeUnit = json['servingSizeUnit']??"";
    labelNutrients = (json['labelNutrients'] != null
        ? new LabelNutrients.fromJson(json['labelNutrients'])
        : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fdcId'] = this.fdcId;
    data['description'] = this.description;
    data['lowercaseDescription'] = this.lowercaseDescription;
    data['score'] = this.score;
    //data['publicationDate'] = this.publicationDate;
    data['dataType'] = this.dataType;
    data['foodClass'] = this.foodClass;
    data['modifiedDate'] = this.modifiedDate;
    data['availableDate'] = this.availableDate;
    data['brandOwner'] = this.brandOwner;
    data['dataSource'] = this.dataSource;
    data['brandedFoodCategory'] = this.brandedFoodCategory;
    data['gtinUpc'] = this.gtinUpc;
    data['householdServingFullText'] = this.householdServingFullText;
    data['ingredients'] = this.ingredients;
    data['marketCountry'] = this.marketCountry;
    data['servingSize'] = this.servingSize;
    data['servingSizeUnit'] = this.servingSizeUnit;
    if (this.labelNutrients != null) {
      data['labelNutrients'] = this.labelNutrients!.toJson();
    }
    return data;
  }
}
