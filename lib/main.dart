import 'package:admin_loja_virtual/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciamento Loja Virtual',
      theme: ThemeData(
        primaryColor:  Color.fromRGBO(255, 199, 44,1.0),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
