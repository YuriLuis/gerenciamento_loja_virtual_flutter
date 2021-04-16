import 'package:admin_loja_virtual/blocs/login_bloc.dart';
import 'package:admin_loja_virtual/widgets/input_field.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(45, 42, 38, 1.0),
      body: StreamBuilder<LoginState>(
          stream: _loginBloc.outState,
          initialData: LoginState.LOADING,
          // ignore: missing_return
          builder: (context, snapshot) {
            switch (snapshot.data) {
              case LoginState.LOADING:
                return Center(
                  child: CircularProgressIndicator(
                    valueColor:
                    AlwaysStoppedAnimation(Theme
                        .of(context)
                        .primaryColor),
                  ),
                );
              case LoginState.FAIL:
              case LoginState.SUCESS:
              case LoginState.IDLE:
                return Stack(
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
                                size: 150.0, color: Theme
                                    .of(context)
                                    .primaryColor),
                            InputField(
                              icon: Icons.person_outlined,
                              hint: 'Usuário',
                              obscure: false,
                              stream: _loginBloc.outEmail,
                              onChanged: _loginBloc.changeEmail,
                            ),
                            InputField(
                              icon: Icons.lock_outline,
                              hint: 'Senha',
                              obscure: true,
                              stream: _loginBloc.outPassword,
                              onChanged: _loginBloc.changePassword,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            StreamBuilder<bool>(
                                stream: _loginBloc.outSubmitValid,
                                builder: (context, snapshot) {
                                  return SizedBox(
                                    height: 50,
                                    child: RaisedButton(
                                        child: Text(
                                          'Entrar',
                                          style: TextStyle(fontSize: 18.0),
                                        ),
                                        textColor: Colors.white,
                                        color: Theme
                                            .of(context)
                                            .primaryColor,
                                        onPressed: snapshot.hasData
                                            ? _loginBloc.submit
                                            : null,
                                        disabledColor: Theme
                                            .of(context)
                                            .primaryColor
                                            .withAlpha(140)),
                                  );
                                })
                          ],
                        ),
                      ),
                    ),
                  ],
                );
            }
          }),
    );
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _loginBloc.outState.listen((state) {
      switch (state) {
        case LoginState.SUCESS :
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen())
          );
          break;
        case LoginState.FAIL :
          showDialog(context: context,
              builder: (context) => AlertDialog(title: Text('Erro'),content: Text('Você não possui os privílegios necessários!'),));
          break;
        case LoginState.LOADING :
        case LoginState.IDLE :
      }
    });
  }
}
