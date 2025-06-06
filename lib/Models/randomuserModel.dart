import 'package:final_holistic_randomuser/Models/RegistrationModel.dart';

class RandomUserModel{
  List result;
  RandomUserModel({required this.result});
  factory RandomUserModel.fromjson(Map<String, dynamic>json){
    List fullData;
    fullData = json['results'].map(
        (user){
          return {
            "Name" : user['name'] ["first"]+ " " + user["name"]["last"],
            "email" : user['email'],
            "img": user["picture"]['thumbnail']

          };
        }
    ).toList();
    return RandomUserModel(result: fullData);
  }
}