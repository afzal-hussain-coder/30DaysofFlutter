import 'package:flutter/material.dart';
import 'package:flutter_new_project/widgets/drawer.dart';

 class HomePage extends StatelessWidget {
   final int days=30;
   final String name ="Afzal Hussain";

   @override
   Widget build(BuildContext context) {

     return Scaffold(
       appBar: AppBar(title: Text("Catalog App"),),
       body: Center(
         child: Container(
           child: Text("Welcome to $days days of Flutter by $name"),
         ),
       ),
       drawer: MyDrawer(),

     );
   }
 }
