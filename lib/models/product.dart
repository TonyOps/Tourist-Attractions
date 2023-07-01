import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  Product.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    name = document['name'] as String;
    value = document['value'] as String;
    date = document['date'] as String;
    description = document['description'] as String;
    email = document['email'] as String;
    facebook = document['facebook'] as String;
    instagram = document['instagram'] as String;
    twitter = document['twitter'] as String;
    message = document['message'] as String;
    photo = document['photo'] as String;
    officeJob = document['officeJob'] as String;
    photos = List<String>.from(document.data['photos'] as List<dynamic>);
  }

  String id;
  String name;
  String officeJob;
  String value;
  String date;
  String description;
  String email;
  String facebook;
  String instagram;
  String twitter;
  String message;
  String photo;
  List<String> photos;
}
