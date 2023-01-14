import 'package:flutter_new_project/models/catalog.dart';

class CartModel{

  static final cartModel = CartModel._internal();

  CartModel._internal();
  factory CartModel()=>cartModel;
  //Catalog fields
  late CatalogModel _catalog;
  // Collections of Ids ==> store ids of each item
  final List<int>itemsId=[];
  // get Catalog
  CatalogModel get catalog =>_catalog;
  // set catalog
  set catalog(CatalogModel newCatlog){
    assert(newCatlog != null);
    _catalog = newCatlog;
  }
// Get item in the cart
  List<Item> get items=> itemsId.map((id) => _catalog.getById(id)).toList();

  // Get total price
   num get totalprice =>items.fold(0, (total, current) => total+current.price);

   // add item
   void addItem(Item item){
     itemsId.add(item.id.toInt());
   }

   //remove item
   void removeItem(Item item){
     itemsId.remove(item.id.toInt());
   }
}