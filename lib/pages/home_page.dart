import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_new_project/Utils/routes.dart';
import 'package:flutter_new_project/models/cart.dart';
import 'package:flutter_new_project/models/catalog.dart';
import 'package:flutter_new_project/pages/details_page.dart';
import 'package:flutter_new_project/widgets/drawer.dart';
import 'package:flutter_new_project/widgets/itemwidgets.dart';
import 'package:flutter_new_project/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/add_to_cart.dart';


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
       floatingActionButton: FloatingActionButton(onPressed: () {
         Navigator.pushNamed(context, MyRoutes.CartRoute);
       },child: Icon(Icons.add_shopping_cart,color: Colors.white,),
       backgroundColor: context.theme.buttonColor,),
       backgroundColor: context.canvasColor,
       body:SafeArea(
         child: Container(
           padding: Vx.m24,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               const CatalogHeader(),
               if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                 const CatalogList().expand()
               else
                CircularProgressIndicator().centered().expand()

             ],
           ),
         ),
       )
      // drawer: const MyDrawer(),

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

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        "Catalog App".text.xl4.bold.color(context.theme.accentColor).make(),
        "Trending Product".text.xl2.make(),

      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(catalog: catalog),));
            },
              child: CatalogItem(catalog: catalog));
        },);
  }
}

class CatalogItem extends StatelessWidget {
 final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
              child: ProductImage(catalog: catalog)),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            catalog.name.text.bold.lg.color(context.accentColor).make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.red400.xl.bold.make(),
                 AddtoCart(catalog:catalog)
                ],
              )
          ],).px8())
        ],
      ).p8()
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}

class ProductImage extends StatelessWidget {
   final Item catalog;

  const ProductImage({super.key, required this.catalog});
 

  @override
  Widget build(BuildContext context) {
    return Image.network(catalog.image).box.rounded.p8.color(context.canvasColor).make().w32(context);
  }
}







