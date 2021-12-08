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
          title:const Text("Todo App"),
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
              return const Center(
                child: Text("Error"),
            );
            default:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        },
        )
      );
  }

Widget get _fabButton => FloatingActionButton(
          onPressed: fabPressed,
          child: const Icon(Icons.add),
);

Widget get _listView => ListView.separated(
      itemCount: productList.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) => (
          CustomCard(
            title: productList[index].productName,
            subtitle: "${productList[index].money}",
            imageUrl: productList[index].imageUrl,
          )));

void fabPressed(){
  showModalBottomSheet(
    isScrollControlled: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25),
      ),
      ),
    context: context,
  builder: (context)=> bottomSheet,
  );
}

Widget get bottomSheet => SizedBox(
  height: MediaQuery.of(context).size.height/3+15,
  child: Column(
    children: const <Widget>[
      AddProductView()
    ],

  ),

);
}