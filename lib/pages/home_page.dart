import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_new_project/Utils/routes.dart';
import 'package:flutter_new_project/models/catalog.dart';
import 'package:flutter_new_project/pages/details_page.dart';
import 'package:flutter_new_project/widgets/drawer.dart';
import 'package:flutter_new_project/widgets/itemwidgets.dart';
import 'package:flutter_new_project/widgets/theme.dart';


 class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   final int days=30;
   final String name ="Afzal Hussain";
   

   @override
  void initState() {
    super.initState();
    loadData();

  }

   @override
   Widget build(BuildContext context) {

     //final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
     return Scaffold(
       backgroundColor: MyThemeData.creamswhite,
       appBar: AppBar(
         title: const Text("Catalog App"),),
       body: Padding(
         padding: const EdgeInsets.all(16.0),
         child: (CatalogModel.items.isNotEmpty)?
         //ListView.builder(itemCount: CatalogModel.items.length,
             //itemBuilder: (context,index){
               GridView.builder(gridDelegate:
               const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                   mainAxisSpacing: 10,crossAxisSpacing: 10),itemBuilder: (context, index) {
                final item = CatalogModel.items[index];
                return InkWell(
                  onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => DetailsPage(catalog: item),));
                  },
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Text(item.name),
                          SizedBox(height: 10,),
                          Hero(
                            tag: Key(item.id.toString()),
                              child: Image.network(item.image,width: 100,height: 100,alignment: Alignment.center,)),
                          Container(
                            width: 150,
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(item.desc,style: TextStyle(fontSize: 12,),)),
                          ),

                          // GridTile(header:Text(item.name),
                          //     child: Image.network(item.image),
                          // footer: Text(item.desc),),
                        ],
                      ),
                    ),
                  ),
                );
              },itemCount: CatalogModel.items.length)
              
                //ItemWidgets(item: CatalogModel.items[index]);
             :const Center(
           child: CircularProgressIndicator(),
         ),
       ),
       drawer: const MyDrawer(),

     );
   }

  void loadData() async{
     await Future.delayed(const Duration(seconds: 2));
    var catalog_json=await rootBundle.loadString("assets/Files/catalog.json");
    var decodedData = jsonDecode(catalog_json);
    var product = decodedData["products"];
    CatalogModel.items =List.from(product).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }
}
