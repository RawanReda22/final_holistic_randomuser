import 'package:flutter/material.dart';
class UserDetails extends StatelessWidget {
   UserDetails({super.key , required this.name , required this.email , required this.img});
  var img;
  var name;
  var email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "RandomUser Details",
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(img),
                ),
                SizedBox(height: 20,),

                Text(
                  name,
                  style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20,),
                Text(email ,  style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                //  Text(address ,  style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),

                const SizedBox(width: 20),


              ],
            ),
          )
      ),
    );
  }
}
