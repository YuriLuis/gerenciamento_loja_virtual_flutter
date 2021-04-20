import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final DocumentSnapshot category;

  CategoryTile(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Card(
        child: ExpansionTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              category.data['icon'],
            ),
            backgroundColor: Colors.transparent,
          ),
          title: Text(
            category.data['title'],
            style:
                TextStyle(color: Colors.grey[850], fontWeight: FontWeight.w500),
          ),
          children: [
            FutureBuilder<QuerySnapshot>(
              future: category.reference.collection('itens').getDocuments(),
              builder: (context, snapshot) => !snapshot.hasData
                  ? Container()
                  : Column(
                      children: snapshot.data.documents.map((e){
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(e.data['images'][0]),
                            backgroundColor: Colors.transparent,
                          ),
                          title: Text(e.data['title']),
                          trailing: Text('R\$${e.data['price'].toStringAsFixed(2)}'),
                          onTap: (){

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
