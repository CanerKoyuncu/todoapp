import 'dart:convert';
import 'dart:io';
import "package:http/http.dart" as http;
import 'package:logger/logger.dart';
import 'package:todoapp/Core/model/product.dart';

class ApiService {

  var logger = Logger();
  String _baseUrl = "";


  static final ApiService _instance = ApiService._privateConstructor();
  ApiService._privateConstructor(){
    _baseUrl = "https://todo-app-768e1-default-rtdb.europe-west1.firebasedatabase.app/";

  }

  static ApiService getInstance(){
    if (_instance == null){
      return ApiService._privateConstructor();
    }
    return _instance;
    
  }

  Future<List<Product>> getProducts() async{
     final http.Response response = await http.get(Uri.parse("${_baseUrl}/product.json/"));
     final jsonResponce  = json.decode(response.body);

     switch (response.statusCode){
       case HttpStatus.ok:
          final producList = ProductList.fromJsonList(jsonResponce);
            return producList.products;
       case HttpStatus.unauthorized:
          Logger().e(jsonResponce);
          break;
     }
     Logger().e(jsonResponce);
     return Future.error(jsonResponce);

  }

  Future addProduct(Product product) async{
    final jsonBody = json.encode(product.toJson());

    final response = await http.post(Uri.parse("$_baseUrl/product.json/"),body: jsonBody);

    final jsonResponse = json.decode(response.body);
    logger.i(response.body);

    switch (response.statusCode) {
      case HttpStatus.ok:
        return Future.value(true);

      case HttpStatus.unauthorized:
        logger.e(jsonResponse);
        break;
       }
        logger.e(jsonResponse);
        return Future.error(jsonResponse);
  }
}