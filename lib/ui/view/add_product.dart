import 'package:flutter/material.dart';
import 'package:todoapp/Core/model/api_service.dart';
import 'package:todoapp/Core/model/product.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({Key? key}) : super(key: key);


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
    return Form(
      key: formKey,
      child: Center(
        child: Padding(padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
          controller: controllerName,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Product Name"
          ),
          validator: validator
          ),
          TextFormField(
            controller: controllerPrice,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Price",
              ),
              validator:validator
          ),
          TextFormField(
            controller: controllerImage,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Image Link",
              ),
              validator:validator
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.send),
            label: const Text("Add"),
            onPressed: () async{
              var model = Product(
                controllerName.text,
                int.parse(controllerPrice.text),
                "https://picsum.photos/400/100",
                );
                await ApiService.getInstance().addProduct(model);
                Navigator.pop(context);
            },
          ),
          ],
          ))
      )
    );
  }
}