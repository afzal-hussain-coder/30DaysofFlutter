import 'package:flutter/material.dart';
import 'package:flutter_new_project/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemeData.creamswhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "cart".text.make(),
      ),
    );
  }
}
