import 'package:admin_loja_virtual/widgets/image_source_sheet.dart';
import 'package:flutter/material.dart';

class ImagesWidget extends FormField<List> {

  ImagesWidget({
    BuildContext context,
    FormFieldSetter<List> onSaved,
    FormFieldValidator<List> validator,
    List initialValue,
    bool autoValidate = false,
  }) :
        super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          autovalidate: autoValidate,
          // ignore: missing_return
          builder: (state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 124,
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: ListView(
                    scrollDirection: Axis
                        .horizontal, //Para rolar as imagens na horizontal
                    children: state.value.map<Widget>((i) {
                      return Container(
                        height: 100, width: 100,
                        child: GestureDetector(
                          child: i is String ? Image.network(
                            i, fit: BoxFit.cover,) :
                          Image.file(i, fit: BoxFit.cover,),
                          onLongPress: () {
                            state.didChange(state.value..remove(i));
                          },
                        ),
                      );
                    }).toList()
                      ..add(GestureDetector(
                        child: Container(height: 100,
                          width: 100,
                          child: Icon(
                            Icons.camera_enhance, color: Colors.white,),
                          color: Colors.white.withAlpha(50),),
                        onTap: () {
                          showModalBottomSheet(context: context,
                          builder: (context) => ImageSourceSheet(
                            onImageSelected: (image){
                              state.didChange(state.value..add(image));
                              Navigator.of(context).pop();
                            },
                          ));
                        },
                      )),

                  ),
                ),
                state.hasError ? Text(state.errorText,
                  style: TextStyle(color: Colors.red, fontSize: 12),) :
                Container(),
              ],
            );
          }
      );

}