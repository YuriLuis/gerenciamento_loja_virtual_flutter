import 'package:admin_loja_virtual/blocs/orders_bloc.dart';
import 'package:admin_loja_virtual/widgets/order_tile.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class OrdersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _ordersBloc = BlocProvider.of<OrdersBloc>(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: StreamBuilder<List>(
          stream: _ordersBloc.outOrders,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data.length == 0) {
              return Center(
                child: Text(
                  'Nenhum pedido encontrado!',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }else {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return OrderTile(snapshot.data[index]);
                },
                itemCount: snapshot.data.length,
              );
            }

          }),
    );
  }
}
