import 'package:flutter/material.dart';
import 'package:flutter_new_project/models/cart.dart';
import 'package:flutter_new_project/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "cart".text.make(),
      ),
      body: Column(children: [
        _CartList(

        ).p32().expand(),
        Divider(color: context.accentColor,),
        _CartTotal(),
      ],),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalprice}".text.xl5.red400.make(),
          ElevatedButton(onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Buying not supported yest!".text.make(),));
          }, 
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(context.theme.buttonColor)),
              child: "Buy".text.make()).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty? "Nothing to show".text.xl2.color(context.accentColor).makeCentered():ListView.builder(
      itemCount: _cart.items?.length,
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.done),
          trailing: IconButton(icon: Icon(Icons.remove_circle_outline),onPressed: () {
           _cart.removeItem(_cart.items[index]);
           setState(() {

           });
          },),
          title: _cart.items[index].name.text.make(),

        ));
  }
}


