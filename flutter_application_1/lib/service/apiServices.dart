import 'dart:convert';
import 'package:http/http.dart' as http;
 class ApiServices{
  Future getAllProducsts() async{
    final allproductsUrl=Uri.parse('https://fakestoreapi.com/products');
    final response =await http.get(allproductsUrl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future getsingleProducst(int id) async{
    final singleproductsUrl=Uri.parse('https://fakestoreapi.com/products/$id');
    final response =await http.get(singleproductsUrl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }
  Future getAllCategories() async{
    final allCategories=Uri.parse('https://fakestoreapi.com/products/categories');
    final response =await http.get(allCategories);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }
   Future getProductByCategory(String catName) async{
    final ProductByCategory=Uri.parse('https://fakestoreapi.com/products/category/$catName');
    final response =await http.get(ProductByCategory);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }
 }