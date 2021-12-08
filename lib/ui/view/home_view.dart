import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:todoapp/Core/model/api_service.dart';
import 'package:todoapp/Core/model/product.dart';
import 'package:todoapp/ui/shared/widgets/custom_card.dart';
import 'package:todoapp/ui/view/add_product.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

@override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>{
ApiService service = ApiService.getInstance();
  List<Product> productList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title:Text("Todo App"),
          ),
        floatingActionButton: _fabButton
        ,
        body: FutureBuilder<List<Product>>(
          future: service.getProducts(),
          builder: (context,snapshot){
          switch (snapshot.connectionState){
            case ConnectionState.done:
              if(snapshot.hasData){
              productList = snapshot.data!;
              return _listView;
              }
              return Center(
                child: Text("Error"),
            );
            default:
              return Center(
                child: CircularProgressIndicator(),
              );
          }
        },
        )
      );
  }

Widget get _fabButton => FloatingActionButton(
          onPressed: fabPressed,
          child: Icon(Icons.add),
);

Widget get _listView => ListView.separated(
      itemCount: productList.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) => (
          CustomCard(
            title: productList[index].productName,
            subtitle: "${productList[index].money}",
            imageUrl: productList[index].imageUrl,
          )));

void fabPressed(){
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25),),),
    context: this.context,
  builder: (context)=> bottomSheet,
  );
}

Widget get bottomSheet => Container(
  
  height: MediaQuery.of(this.context).size.height/3,
  
  child: Column(
    children: <Widget>[
      AddProductView()
    ],

  ),

);
}