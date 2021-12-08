import 'package:flutter/material.dart';
import 'package:todoapp/Core/model/product.dart';

class AddProductView extends StatefulWidget {

  @override
  _AddProductViewState createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {

  GlobalKey<FormState> formKey = GlobalKey(debugLabel: "formKey");

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerImage = TextEditingController();
  String validator(val){
    if(val.isEmpty){
      return "This area is not accept empty value";
    }
    else{
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formKey,
        child: Center(
          child: Padding(padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[TextFormField(
            controller: controllerName,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Product Name"),
            validator: this.validator),

            TextFormField(
              controller: controllerPrice,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Price",
                ),
                validator:this.validator
            ),
            TextFormField(
              controller: controllerImage,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Image Link",
                ),
                validator:this.validator
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.send),
              label: Text("Add"),
              onPressed: () async{
                var model = Product(
                  controllerName.text,
                  int.parse(controllerPrice.text),
                  controllerImage.text,
                  );
              },
            ),
            ],
            ))
        )
      )
    );
  }
}