import 'package:admin_loja_virtual/widgets/order_header.dart';
import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Card(
        child: ExpansionTile(
          title: Text(
            '#121321 - Entregue',
            style: TextStyle(color: Colors.green),
          ),
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  OrderHeader(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text('Camiseta preta P'),
                        subtitle: Text('camiseta/sdashdjkas'),
                        trailing: Text(
                          '2',
                          style: TextStyle(fontSize: 20),
                        ),
                        contentPadding: EdgeInsets.zero,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(
                        onPressed: () {},
                        child: Text('Excluir'),
                        textColor: Colors.red,
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text('Regredir'),
                        textColor: Colors.grey[850],
                      ),                      FlatButton(
                        onPressed: () {},
                        child: Text('Avançar'),
                        textColor: Colors.green,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
