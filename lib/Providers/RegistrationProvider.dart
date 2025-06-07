import 'package:final_holistic_randomuser/Models/RegistrationModel.dart';
import 'package:final_holistic_randomuser/Services/RegistrationService.dart';
import 'package:flutter/cupertino.dart';

class RegistrationProvider extends ChangeNotifier{
  RegistrationModel? registrationModel;
  Future<void> signup({required String name,
    required String email,
    required String phone,
    required String password,})async{
    registrationModel = await RegistrationService.signUp(name: name,
        email: email, phone: phone, password: password);
    notifyListeners();
}

Future<void> login({required String email, required String password,})async{
    registrationModel = await RegistrationService.login(email: email, password: password);
    notifyListeners();
}

}