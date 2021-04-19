import 'package:admin_loja_virtual/blocs/user_bloc.dart';
import 'package:admin_loja_virtual/widgets/user_tile.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class UsersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _usersBloc = BlocProvider.of<UserBloc>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                hintText: 'Pesquisar',
                hintStyle: TextStyle(color: Colors.white),
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                border: InputBorder.none),
          ),
        ),
        Expanded(
          child: StreamBuilder<List>(
              stream: _usersBloc.outUsers,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(
                          Color.fromRGBO(255, 199, 44, 1.0)),
                    ),
                  );
                } else if (snapshot.data.length == 0) {
                  return Center(
                    child: Text(
                      'Nenhum usuário encontrado!',
                      style:
                          TextStyle(color: Color.fromRGBO(255, 199, 44, 1.0)),
                    ),
                  );
                }else {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return UserTile(snapshot.data[index]);
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: snapshot.data.length,
                  );
                }
              }),
        )
      ],
    );
  }
}
