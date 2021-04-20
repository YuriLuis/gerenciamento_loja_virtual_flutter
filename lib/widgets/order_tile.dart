import 'package:admin_loja_virtual/widgets/order_header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  final DocumentSnapshot order;

  OrderTile(this.order);
  final states = [
    '', 'Em Preparação', 'Em Transporte', 'Aguardando Entrega', 'Entregue'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Card(
        child: ExpansionTile(
          title: Text(
            '${order.documentID.substring(order.documentID.length - 7, order.documentID.length)} - '
                '${states[order.data['status']]}',
            style: TextStyle(color: order.data['status'] != 4 ? Colors.grey[850] : Colors.green),
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
                    children: order.data['products'].map<Widget>((p){
                      return ListTile(
                        title: Text(p['product']['title'] + " " + p['size']),
                        subtitle: Text(p['category'] + "/" + p['pid']),
                        trailing: Text(p['quantity'].toString(), style: TextStyle(fontSize: 20),),
                        contentPadding: EdgeInsets.zero,
                      );
                    }).toList()
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
                      ),
                      FlatButton(
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
