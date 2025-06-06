import 'package:final_holistic_randomuser/Models/randomuserModel.dart';
import 'package:final_holistic_randomuser/Services/User_Service.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier{
  RandomUserModel? randomUserModel;
  Future <void>fetchUsers()async{
    randomUserModel = await UserService.getUsers();
    notifyListeners();
  }
}