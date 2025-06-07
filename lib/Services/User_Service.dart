import 'package:dio/dio.dart';
import 'package:final_holistic_randomuser/Models/randomuserModel.dart';
class UserService{
static Dio dio = Dio();
static Future<RandomUserModel>getUsers()async{
  String url = "https://randomuser.me/api/?results=100";
  var response = await dio.get(url);
  if(response.statusCode == 200){
    return RandomUserModel.fromjson(response.data);
  }
  else{
    throw Exception("Tray Again");
  }
}

static Future<RandomUserModel>getGender({required String gender})async{
  String url = "https://randomuser.me/api/?results=100&gender=$gender";
  var response = await dio.get(url);
  if(response.statusCode == 200){
    return RandomUserModel.fromjson(response.data);
  }
  else{
    throw Exception("Tray Again");
  }
}
}