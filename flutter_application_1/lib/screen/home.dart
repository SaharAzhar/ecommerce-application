import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/category.dart';
import 'package:flutter_application_1/screen/productdetail.dart';
import 'package:flutter_application_1/service/apiServices.dart';
class homeSrcn extends StatelessWidget {
  const homeSrcn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API section"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 25, 3, 113),
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Categories()));
        }, 
        icon:Icon(Icons.view_list))
        ],
      ),
      body: FutureBuilder(
        future: ApiServices().getAllProducsts(),
        builder:(context,AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return  Center(
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(snapshot.data[index]['title']),
                  leading: Image.network(snapshot.data[index]['image'],height: 50,width: 50,),
                  subtitle: Text('price - \$'+snapshot.data[index]['price'].toString()),
                  onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>ProductDetails(
                      snapshot.data[index]['id'])));
                  },
                );
              })
          );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}