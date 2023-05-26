import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/apiServices.dart';
class ProductDetails extends StatelessWidget {
  final int id;
   ProductDetails(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 25, 3, 113),
      ),
      body: FutureBuilder(
        future: ApiServices().getsingleProducst(id),
        builder: (context , AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   SizedBox(height: 30,),
                  Image.network(snapshot.data['image'],height: 200,width: double.infinity,),
                  SizedBox(height: 10,),
                  Center(
                    
                    child: Text("\$"+snapshot.data['price'].toString(),
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      
                    ),
                    ),
                  ),
                  Text(snapshot.data['title'],
                  style: TextStyle(
                    fontSize: 25,
                  ),),SizedBox(height: 10,),
                  Chip(label: Text(snapshot.data['category'].toString(),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),),backgroundColor: Colors.blueGrey,
                  ),
                  SizedBox(height: 30,),
                  Text(snapshot.data['description']),

                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator(),);
        }),
        floatingActionButton: FloatingActionButton(onPressed: (){},
        backgroundColor: Colors.green,
        child: Icon(Icons.add_shopping_cart_outlined),),
        floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat ,

    );
  }
}