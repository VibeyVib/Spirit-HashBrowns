import 'food.dart';

class SearchItem {
  int totalHits=0;
  int currentPage=0;
  int totalPages=0;
  List<Food> foods=[];

  SearchItem({required this.totalHits, required this.currentPage, required this.totalPages, required this.foods});

  SearchItem.fromJson(Map<String, dynamic> json) {
    totalHits = json['totalHits'];
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    if (json['foods'] != null) {
      foods =  <Food>[];
      json['foods'].forEach((v) {
        foods.add(new Food.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalHits'] = this.totalHits;
    data['currentPage'] = this.currentPage;
    data['totalPages'] = this.totalPages;
    if (this.foods != null) {
      data['foods'] = this.foods.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
