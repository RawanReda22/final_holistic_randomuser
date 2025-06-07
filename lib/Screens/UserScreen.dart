import 'package:final_holistic_randomuser/Providers/UserProvider.dart';
import 'package:final_holistic_randomuser/Widget/UserWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class UserScreen extends StatelessWidget {
   UserScreen({super.key,  this.gender });
final  gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Users",style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Consumer<UserProvider>(builder: (context, provider, child) {
        var providerObject = provider.randomUserModel;
        if(providerObject == null){
          provider.fetchUsers();
          return Center(child: CircularProgressIndicator(),);
        }else{
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: () {
                    provider.fetchGender(gender: 'female');
                  }, icon: Icon(Icons.female),),
                  SizedBox(height: 10, width: 10,),
                  IconButton(onPressed: () {
                    provider.fetchGender(gender: 'male');
                  }, icon: Icon(Icons.male)),
                  SizedBox(height: 10, width: 10,),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: providerObject.result.length,
                  itemBuilder: (context, index) {
                  final img = providerObject.result.elementAt(index)['img'];
                  final name = providerObject.result.elementAt(index)['Name'];
                  final email = providerObject.result.elementAt(index)['email'];
                  return UserWidget(
                      email: email,
                      name: name,
                      img: img
                  );
                }
                ),
              ),
            ],
          );
        }
      },)

    );
  }
}
