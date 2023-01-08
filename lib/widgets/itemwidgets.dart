import 'package:flutter/material.dart';
import 'package:flutter_new_project/models/catalog.dart';
class ItemWidgets extends StatelessWidget {
  final Item item;

  const ItemWidgets({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: StadiumBorder(),
      child: ListTile(
        onTap: () {
          print("${item.name} pressed");
        },
        leading: CircleAvatar(backgroundImage: NetworkImage(item.image)),
        title: Text(item.name),
        subtitle: Text(item.des),
        trailing: Text("\$${item.price.toString()
        }", style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
