import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/apiServices.dart';
class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        backgroundColor:  Color.fromARGB(255, 25, 3, 113),
      ),
      body: FutureBuilder(
        future: ApiServices().getAllCategories(),
        builder: (context , AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return Center(
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    
                    child: Card(
                      elevation: 2,
                      margin: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Container(
                        padding: EdgeInsets.all(40),
                        child: Center(
                          child: Text(snapshot.data[index].toString().toUpperCase(),
                          style:TextStyle(fontSize: 25) ,),
                        ),
                      ),
                    ),
                  );
                })
                ),
            );
          }return Center(
            child: CircularProgressIndicator(),
          );
        }),
    );
  }
}