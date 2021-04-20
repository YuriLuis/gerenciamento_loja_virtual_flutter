import 'package:admin_loja_virtual/widgets/category_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProdutctTab extends StatefulWidget {
  @override
  _ProdutctTabState createState() => _ProdutctTabState();
}

class _ProdutctTabState extends State<ProdutctTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection('products').getDocuments(),
        builder: (context, snapshot) => !snapshot.hasData
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) =>
                    CategoryTile(snapshot.data.documents[index])));
  }

  @override
  bool get wantKeepAlive => true;
}
