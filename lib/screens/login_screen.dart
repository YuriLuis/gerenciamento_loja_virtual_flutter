import 'package:admin_loja_virtual/widgets/input_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(45, 42, 38, 1.0),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(Icons.store_mall_directory,
                      size: 150.0, color: Theme.of(context).primaryColor),
                  InputField(icon: Icons.person_outlined, hint: 'Usuário', obscure: false,),
                  InputField(icon: Icons.lock_outline, hint: 'Senha', obscure: true,),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 50,
                    child: RaisedButton(
                      child: Text(
                        'Entrar',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor,
                      onPressed: () {

                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
