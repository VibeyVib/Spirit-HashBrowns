class UserSignUp{
  UserSignUp({required this.type, required this.amount, required this.description
  });
  String? type;
  int? amount;
  String? description;


  Map <String, dynamic> toMap(){
    return {
      'type':type,
      'amount':amount,
      'description':description,
    };
  }
}