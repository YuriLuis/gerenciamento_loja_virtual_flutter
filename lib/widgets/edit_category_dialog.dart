import 'dart:io';

import 'package:admin_loja_virtual/blocs/category_bloc.dart';
import 'package:admin_loja_virtual/widgets/image_source_sheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditCategotyDialog extends StatefulWidget {

  final DocumentSnapshot category;

  EditCategotyDialog({this.category});

  @override
  _EditCategotyDialogState createState() =>
      _EditCategotyDialogState(
          category: category
      );
}

class _EditCategotyDialogState extends State<EditCategotyDialog> {

  final CategoryBloc _categoryBloc;
  final TextEditingController _controller;

  _EditCategotyDialogState({DocumentSnapshot category})
      :
        _categoryBloc = CategoryBloc(category: category),
        _controller = TextEditingController(
            text: category != null ? category.data['title'] : "");

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: GestureDetector(
                onTap: (){
                  showModalBottomSheet(context: context, builder: (context) => ImageSourceSheet(
                    onImageSelected: (image){
                      Navigator.of(context).pop();
                      _categoryBloc.setImage(image);
                    },
                  ));
                },
                child: StreamBuilder(
                    stream: _categoryBloc.outImage,
                    // ignore: missing_return
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        return CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: snapshot.data is File ? Image.file(snapshot
                                .data, fit: BoxFit.cover,) :
                            Image.network(snapshot.data, fit: BoxFit.cover,)
                        );
                      } else {
                        return Icon(Icons.image);
                      }
                    }
                ),
              ),
              title: StreamBuilder<String>(
                stream: _categoryBloc.outTitle,
                builder: (context, snapshot) {
                  return TextField(
                    controller: _controller,
                    onChanged: _categoryBloc.setTitle,
                    decoration: InputDecoration(
                      errorText: snapshot.hasError ? snapshot.error : null
                    ),
                  );
                }
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StreamBuilder<bool>(
                    stream: _categoryBloc.outDelete,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Container();
                      }
                      return FlatButton(
                        onPressed: snapshot.data ? () {

                        } : null,
                        child: Text('Excluir'),
                        textColor: Colors.red,
                      );
                    }
                ),
                StreamBuilder<bool>(
                  stream: _categoryBloc.submitValid,
                  builder: (context, snapshot) {
                    return FlatButton(
                      onPressed: snapshot.hasData ? (){} : null,
                      child: Text('Salvar'),
                    );
                  }
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
