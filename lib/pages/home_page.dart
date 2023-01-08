import 'package:flutter/material.dart';
import 'package:flutter_new_project/models/catalog.dart';
import 'package:flutter_new_project/widgets/drawer.dart';
import 'package:flutter_new_project/widgets/itemwidgets.dart';

 class HomePage extends StatelessWidget {
   final int days=30;
   final String name ="Afzal Hussain";

   @override
   Widget build(BuildContext context) {
     final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
     return Scaffold(
       appBar: AppBar(

         title: Text("Catalog App"),),
       body: Padding(
         padding: const EdgeInsets.all(8.0),
         child: ListView.builder(itemCount: dummyList.length,
             itemBuilder: (context,index){
              return ItemWidgets(item: dummyList[index]);
             }),
       ),
       drawer: MyDrawer(),

     );
   }
 }
