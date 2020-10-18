// Class of productStores
import 'package:flutter/cupertino.dart';

class Store {
  String itemName;
  String description;
  double itemPrice;
  String itemImage;
  double itemRating;
  int itemqyt;

  Store(
      {this.itemName,
      this.itemPrice,
      this.itemImage,
      this.itemRating,
      this.description,
      this.itemqyt});
}

List<Store> storeItems = [
  Store(
      itemName: "Men's casual lace-up low-top sneakers",
      itemPrice: 2500.00,
      itemImage:
          "https://static.nike.com/a/images/f_auto/q_auto:eco/t_PDP_864_v1/0123eb65-845e-4339-97be-553bb76430a2/air-zoom-tempo-next-running-shoe-chNfdw.jpg",
      itemqyt: 1),
  Store(
      itemName: "Trendy Board Shoes, Sports, Leisure, Running, Trendy Shoes",
      itemPrice: 2500.00,
      itemImage:
          "https://static.nike.com/a/images/f_auto/q_auto:eco/t_PDP_864_v1/47349c11-3f88-430f-b56e-4207caef0031/dri-fit-wild-run-running-t-shirt-VRZK0D.jpg",
      itemRating: 0.0,
      itemqyt: 1),
  Store(
      itemName: "Men's Breathable Stylish Casual Shoes",
      itemPrice: 2500.00,
      itemImage:
          "https://static.nike.com/a/images/f_auto/q_auto:eco/t_PDP_864_v1/11d96b4e-6960-4598-b2ee-6f456b9253ba/stride-wild-run-unlined-running-shorts-42DkbH.jpg",
      itemRating: 0.0,
      itemqyt: 1),
  Store(
      itemName: "Men's Handsome Comfortable Sport Casuals Shoes",
      itemPrice: 2500.00,
      itemImage:
          "https://static.nike.com/a/images/f_auto/q_auto:eco/t_PDP_864_v1/47349c11-3f88-430f-b56e-4207caef0031/dri-fit-wild-run-running-t-shirt-VRZK0D.jpg",
      itemRating: 0.0,
      itemqyt: 1),
  Store(
      itemName: "Men Leather Shoes Pointed England Business Formal Wear",
      itemPrice: 2500.00,
      itemImage:
          "https://static.nike.com/a/images/f_auto/q_auto:eco/t_PDP_864_v1/4c3716d6-409c-4458-a2ee-3af6d25353b7/stride-wild-run-unlined-running-shorts-42DkbH.jpg",
      itemRating: 0.0,
      itemqyt: 1),
  Store(
      itemName: "Korean Version Sports Men's Casual Front Strap Shoes",
      itemPrice: 2500.00,
      itemImage:
          "https://static.nike.com/a/images/f_auto/q_auto:eco/t_PDP_864_v1/e659726b-234d-4691-8cb9-b155ab04bc69/air-zoom-tempo-next-flyease-running-shoe-40pJSQ.jpg",
      itemRating: 0.0,
      itemqyt: 1),
];

class Cart extends ChangeNotifier {
  final List<Store> items = [];
  int shipping = 1000;
  int subTotal;

  void addproducts(Store store) {
    //not storeItems.add...
    items.add(store);
    notifyListeners();
  }

  int get countproducts {
    return items.length;
  }

  void qty(int index) {
    items[index].itemqyt++;
  }
}
