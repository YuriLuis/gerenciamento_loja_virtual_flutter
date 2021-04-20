import 'package:admin_loja_virtual/blocs/products_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final String categoryId;
  final DocumentSnapshot product;
  final ProductBloc _productBloc;

  ProductScreen({this.categoryId, this.product}) :
        _productBloc = ProductBloc(categoryId: categoryId, product: product );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(45, 42, 38, 1.0),
      appBar: AppBar(
        elevation: 0,
        title: Text('Criar Produto'),
        actions: [
          IconButton(icon: Icon(Icons.remove), onPressed: (){}),
          IconButton(icon: Icon(Icons.save), onPressed: (){})
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [

          ],
        ),
      ),
    );
  }
}
