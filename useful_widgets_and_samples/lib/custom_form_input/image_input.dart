import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// This class will represent a image list.
// Then, it needs to extends FormField<List>
class ImageInput extends FormField<List>{

  ImageInput({
    BuildContext context,
    FormFieldSetter<List> onSaved, // Executed when the we save the form and it is valid
    FormFieldValidator<List> validator, // Validate the input
    List initialValue,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled
  }) : super(
    onSaved: onSaved,
    validator: validator,
    initialValue: [],
    autovalidateMode: autovalidateMode,
    builder: (state){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 124,
            padding: EdgeInsets.only(top: 16, bottom: 8, left: 5),
            child: ListView(
              scrollDirection: Axis.horizontal,

              // Render the images
              children: state.value == null ? [] : state.value.map<Widget>((image){
                return Stack(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.only(right: 10),
                      child: Image.file(image, fit: BoxFit.cover,),
                    ),
                    Positioned(
                      top: -8,
                      right: 0,
                      child: IconButton(
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: (){
                          // Delete the image
                          state.didChange(state.value..remove(image));
                        },
                      ),
                    )
                  ],
                );
              }).toList()
              ..add( // Add the "+" button
                GestureDetector(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();

                    // Add image to List
                    final image = await picker.getImage(source: ImageSource.camera,);
                    if(image == null) return;

                    state.didChange(state.value..add(File(image.path)));
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: Colors.white,),
                        Text('Imagem', style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                )
              ),
            ),
          ),

          // Error text render
          state.hasError ? Text(
            ' ' + state.errorText,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.red,
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ) : Container()
        ],
      );
    }
  );
}