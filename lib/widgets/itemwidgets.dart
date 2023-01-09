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
        leading: Image.network(item.image),
       // CircleAvatar(backgroundImage: NetworkImage(item.image),backgroundColor: Colors.transparent,),

        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price.toString()
        }", style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
