import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Title',
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text('Subtitle', style: TextStyle(color: Colors.white)),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('Pedidos: 0', style: TextStyle(color: Colors.white),),
          Text('Total Gasto R\$: 0,00', style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}
