import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_new_project/models/catalog.dart';
import 'package:flutter_new_project/widgets/drawer.dart';
import 'package:flutter_new_project/widgets/itemwidgets.dart';

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
       appBar: AppBar(

         title: Text("Catalog App"),),
       body: Padding(
         padding: const EdgeInsets.all(8.0),
         child: (CatalogModel.items.isNotEmpty)? ListView.builder(itemCount: CatalogModel.items.length,
             itemBuilder: (context,index){
              return ItemWidgets(item: CatalogModel.items[index]);
             }):const Center(
           child: CircularProgressIndicator(),
         ),
       ),
       drawer: MyDrawer(),

     );
   }

  void loadData() async{
     await Future.delayed(Duration(seconds: 2));
    var catalog_json=await rootBundle.loadString("assets/Files/catalog.json");
    var decodedData = jsonDecode(catalog_json);
    var product = decodedData["products"];
    CatalogModel.items =List.from(product).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }
}
