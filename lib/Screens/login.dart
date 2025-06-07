import 'package:final_holistic_randomuser/Providers/RegistrationProvider.dart';
import 'package:final_holistic_randomuser/Screens/SignupScreen.dart';
import 'package:final_holistic_randomuser/Screens/UserScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Login extends StatelessWidget {
   Login({super.key});
  final formkey = GlobalKey<FormState>();
  TextEditingController email1 = TextEditingController();
  TextEditingController password1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistrationProvider>(context , listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login" ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: formkey,
            child: Container(
             width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: email1,
                    validator: (value) {
                      if(value == null || value!.isEmpty ){
                        return "Required";
                      }
                      if(!value.endsWith("@gmail.com")){
                        return "Must end with @gmail.com";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        label: Text("Email"),
                        suffixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                    ),
                  ),SizedBox(height: 10,),
                  TextFormField(
                    controller: password1,
                    validator: (value) {
                      if(value == null ||value!.isEmpty){
                        return "Required";
                      }
                      if(value.length <4){
                        return "Password must be greater than 4";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        label: Text("Password"),
                        suffixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                    ),
                  ),SizedBox(height: 10,),
                  MaterialButton(onPressed: () async{
                   await provider.login(email: email1.text, password: password1.text);
                    if(provider.registrationModel!.status == true){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UserScreen(),));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(provider.registrationModel!.message))
                      );
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(provider.registrationModel!.message))
                      );
                    }
                  },
                    child:  Text("Login",style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),
                  )
                  ),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen(),));
                  }, child: Text("Sign up" , style: TextStyle(fontSize: 15),)),
                ],
              ),
            )
        ),
      ),
    );
  }
}
