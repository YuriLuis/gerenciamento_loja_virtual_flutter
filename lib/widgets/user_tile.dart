import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final Map<String, dynamic> user;

  UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    if (user.containsKey('money')) {
      return ListTile(
        title: Text(
          user['name'],
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(user['email'], style: TextStyle(color: Colors.white)),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Pedidos: ${user['orders']}',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Gasto R\$: ${user['money']}',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      );
    } else {
      return Container(
        child: CircularProgressIndicator(),
      );
    }
  }
}
