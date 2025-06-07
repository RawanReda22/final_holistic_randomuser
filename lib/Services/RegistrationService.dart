import 'package:dio/dio.dart';
import 'package:final_holistic_randomuser/Models/RegistrationModel.dart';
class RegistrationService{
  static Dio dio = Dio();
  static Future<RegistrationModel> signUp({required String name,
    required String email,
    required String phone,
    required String password,})async{
   String url = "https://elsewedyteam.runasp.net/api/Register/AddUser";
   var response = await dio.post(url , data: {
     "name":name,
     "password":password,
     "phone":phone,
     "email":email
   });
   if(response.statusCode == 200){
     return RegistrationModel.fromjson(response.data);
   }
   else{
     throw Exception("try again");
   }
  }


  static Future<RegistrationModel>login({required String email, required String password,})async{
    String url = "https://elsewedyteam.runasp.net/api/Login/CheckUser";
    var response=await dio.post(url , data: {
      "email" : email,
      "password" : password,
    });
    if(response.statusCode == 200){
      return RegistrationModel.fromjson(response.data);
    }
    else{
      throw Exception("try again");
    }
  }
}