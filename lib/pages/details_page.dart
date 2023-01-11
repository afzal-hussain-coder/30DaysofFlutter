import 'package:flutter/material.dart';
import 'package:flutter_new_project/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';
class DetailsPage extends StatelessWidget {
  final Item catalog;

  const DetailsPage({super.key, required this.catalog});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: "Catalog Details".text.xl3.make(),
      ),
      backgroundColor: MyThemeData.creamswhite,
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${catalog.price}".text.xl2.bold.color(Colors.red).make(),
          ElevatedButton(onPressed: () => {

          },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MyThemeData.darkBluishColor),
                shape: MaterialStateProperty.all(StadiumBorder())
              ),

              child: "Buy".text.xl.bold.make()).w24(context)
        ],

      ).px16(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image,)).p12().h40(context),
            Expanded(child: VxArc(
              height: 30.0,
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              child: Container(
                width: context.screenWidth,
                color: Colors.white,
                child: Column(
                children: [
                  catalog.name.text.xl4.color(MyThemeData.darkBluishColor).bold.make(),
                  catalog.desc.text.textStyle(context.captionStyle).xl.color(MyThemeData.darkBluishColor).bold.make(),
                  10.heightBox
                ],
                ).py64(),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
