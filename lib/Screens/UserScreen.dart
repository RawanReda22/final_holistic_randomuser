import 'package:final_holistic_randomuser/Providers/UserProvider.dart';
import 'package:final_holistic_randomuser/Widget/UserWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

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
          return ListView.builder(
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
              },
          );
        }
      },)

    );
  }
}
