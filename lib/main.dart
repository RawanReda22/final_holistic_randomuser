import 'package:final_holistic_randomuser/Providers/RegistrationProvider.dart';
import 'package:final_holistic_randomuser/Providers/UserProvider.dart';
import 'package:final_holistic_randomuser/Screens/UserScreen.dart';
import 'package:final_holistic_randomuser/Screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => RegistrationProvider(),),
          ChangeNotifierProvider(create: (context) => UserProvider(),)
        ],
      child: MaterialApp(
        home: Login(),
        debugShowCheckedModeBanner: false,
      ),
    );

  }
}
