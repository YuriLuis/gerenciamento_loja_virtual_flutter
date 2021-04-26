import 'package:admin_loja_virtual/screens/product_screen.dart';
import 'package:admin_loja_virtual/widgets/edit_category_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final DocumentSnapshot category;

  CategoryTile(this.category);
  String _primeiraImagem = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Card(
        child: ExpansionTile(
          leading: GestureDetector(
            onTap: (){
              showDialog(context: context, builder: (context) => EditCategoryDialog());
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                category.data['icon'],
              ),
              backgroundColor: Colors.transparent,
            ),
          ),
          title: Text(
            category.data['title'],
            style:
                TextStyle(color: Colors.grey[850], fontWeight: FontWeight.w500),
          ),
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: category.reference.collection('itens').snapshots(),
              builder: (context, snapshot) => !snapshot.hasData
                  ? Container()
                  : Column(
                      children: snapshot.data.documents.map((doc){
                        if(_primeiraImagem.isEmpty){
                          _primeiraImagem = "";
                          _primeiraImagem = doc.data['images'][0];
                        }else {
                          _primeiraImagem = "";
                          _primeiraImagem = doc.data['images'][0];
                        }
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(_primeiraImagem),
                            backgroundColor: Colors.transparent,
                          ),
                          title: Text(doc.data['title']),
                          trailing: Text('R\$${doc.data['price'].toStringAsFixed(2)}'),
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => ProductScreen(
                                categoryId: category.documentID,
                                product: doc,
                              ))
                            );
                          },
                        );
                      }).toList()..add(
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Icon(Icons.add, color: Color.fromRGBO(255, 199, 44,1.0),),
                          ),
                          title: Text('Adicionar'),
                          onTap: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => ProductScreen(
                                  categoryId: category.documentID,
                                ))
                            );
                          },
                        )
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
