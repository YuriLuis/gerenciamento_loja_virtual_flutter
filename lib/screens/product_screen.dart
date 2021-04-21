import 'package:admin_loja_virtual/blocs/products_bloc.dart';
import 'package:admin_loja_virtual/widgets/images_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final String categoryId;
  final DocumentSnapshot product;

  ProductScreen({this.categoryId, this.product});

  @override
  _ProductScreenState createState() => _ProductScreenState(categoryId, product);
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductBloc _productBloc;
  final _formKey = GlobalKey<FormState>();

  _ProductScreenState(String categoryId, DocumentSnapshot product)
      : _productBloc = ProductBloc(categoryId: categoryId, product: product);

  @override
  Widget build(BuildContext context) {
    final _fieldStyle =
        TextStyle(color: Colors.white, fontSize: 16);

    InputDecoration _buildDecoration(String label) {
      return InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(255, 199, 44, 1.0))),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(255, 199, 44, 1.0))),
        hintStyle: TextStyle(color: Colors.green),
      );
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(45, 42, 38, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 199, 44, 1.0),
        elevation: 0,
        title: Text('Criar Produto'),
        actions: [
          IconButton(icon: Icon(Icons.remove), onPressed: () {}),
          IconButton(icon: Icon(Icons.save), onPressed: () {})
        ],
      ),
      body: Form(
        key: _formKey,
        child: StreamBuilder<Map>(
          stream: _productBloc.outData,
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return Container();
            }else {
              return ListView(
                padding: EdgeInsets.all(16),
                children: [
                  Text('Imagens', style: TextStyle(color: Colors.white, fontSize: 12),),
                  ImagesWidget(),
                  TextFormField(
                    initialValue: snapshot.data['title'],
                    cursorColor: Color.fromRGBO(255, 199, 44, 1.0),
                    style: _fieldStyle,
                    decoration: _buildDecoration('titulo'),
                    onSaved: (text) {},
                    // ignore: missing_return
                    validator: (text) {},
                  ),
                  TextFormField(
                    initialValue: snapshot.data['description'],
                    cursorColor: Color.fromRGBO(255, 199, 44, 1.0),
                    style: _fieldStyle,
                    maxLines: 6,
                    decoration: _buildDecoration('Descrição'),
                    onSaved: (text) {},
                    // ignore: missing_return
                    validator: (text) {},
                  ),
                  TextFormField(
                    initialValue: snapshot.data['price']?.toStringAsFixed(2),
                    cursorColor: Color.fromRGBO(255, 199, 44, 1.0),
                    style: _fieldStyle,
                    decoration: _buildDecoration('Preço'),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    onSaved: (text) {},
                    // ignore: missing_return
                    validator: (text) {},
                  )
                ],
              );
            }

          }
        ),
      ),
    );
  }
}
