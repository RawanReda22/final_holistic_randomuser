import 'package:flutter/material.dart';
class UserWidget extends StatelessWidget {
   UserWidget({super.key , required this.email , required this.name , required this.img});
var img;
var name;
var email;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            child: Image.network(img),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(name , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(email , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
