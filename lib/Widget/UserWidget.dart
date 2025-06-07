import 'package:final_holistic_randomuser/Screens/userDetails.dart';
import 'package:flutter/material.dart';
class UserWidget extends StatelessWidget {
   UserWidget({super.key , required this.email , required this.name , required this.img});
var img;
var name;
var email;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder:(context) =>
                UserDetails(name: name, email: email, img: img),)
            );
          } ,
          child: Row(

            children: [
              CircleAvatar( radius: 30,
                backgroundImage: NetworkImage(img),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(email ,  style: const TextStyle(fontWeight: FontWeight.bold)),

                ],
              ),
            ],
          ),
        )
    );
  }
}
