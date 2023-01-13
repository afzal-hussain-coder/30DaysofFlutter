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
        backgroundColor: Colors.transparent,
        title: "Catalog Details".text.color(context.accentColor).xl3.make(),
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          buttonPadding: EdgeInsets.zero,
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.xl2.bold.color(Colors.red).make(),
            ElevatedButton(
                    onPressed: () => {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            MyThemeData.darkBluishColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Add to cart".text.xl.bold.make())
                .wh(120, 40)
          ],
        ).p16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(
                  catalog.image,
                )).p12().h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              child: Container(
                width: context.screenWidth,
                color: context.cardColor,
                child: Column(
                  children: [
                    catalog.name.text.xl4
                        .color(context.accentColor)
                        .bold
                        .make(),
                    catalog.desc.text
                        .textStyle(context.captionStyle)
                        .xl
                        .color(context.accentColor)
                        .bold
                        .make(),
                    10.heightBox,
                    "If you use this site regularly and would like to help keep the site on the Internet, please consider donating a small sum to help pay for the hosting and bandwidth bill. There is no minimum donation"
                        .text
                        .textStyle(context.captionStyle)
                        .color(context.accentColor)
                        .make()
                        .p16()
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
