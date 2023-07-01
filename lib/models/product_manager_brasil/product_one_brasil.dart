import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:liberty/models/product.dart';

class ProductOneBrasil extends ChangeNotifier {
  ProductOneBrasil() {
    _loadAllProductOneBrasil();
  }

  final Firestore firestore = Firestore.instance;

  List<Product> allProductsOneBrasil = [];

  Future<void> _loadAllProductOneBrasil() async {
    firestore.collection('ProductOneBrasil').snapshots().listen((snapshot) {
      allProductsOneBrasil.clear();
      for (final DocumentSnapshot document in snapshot.documents) {
        allProductsOneBrasil.add(Product.fromDocument(document));
      }
      notifyListeners();
    });
  }
}

