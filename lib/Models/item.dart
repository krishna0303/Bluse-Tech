import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  String title;
  String shortInfo;
  Timestamp publishedDate;
  String thumbnailUrl1;
  String thumbnailUrl2;
  String thumbnailUrl3;
  String longDescription;
  String status;
  int price;

  ItemModel({
    this.title,
    this.shortInfo,
    this.publishedDate,
    this.thumbnailUrl1,
    this.thumbnailUrl2,
    this.thumbnailUrl3,
    this.longDescription,
    this.status,
  });

  ItemModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    shortInfo = json['shortInfo'];
    publishedDate = json['publishedDate'];
    thumbnailUrl1 = json['thumbnailUrl1'];
    thumbnailUrl2 = json['thumbnailUrl2'];
    thumbnailUrl3 = json['thumbnailUrl3'];
    longDescription = json['longDescription'];
    status = json['status'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['shortInfo'] = this.shortInfo;
    data['price'] = this.price;
    if (this.publishedDate != null) {
      data['publishedDate'] = this.publishedDate;
    }
    data['thumbnailUrl1'] = this.thumbnailUrl1;
    data['thumbnailUrl2'] = this.thumbnailUrl2;
    data['thumbnailUrl3'] = this.thumbnailUrl3;
    data['longDescription'] = this.longDescription;
    data['status'] = this.status;
    return data;
  }
}

class PublishedDate {
  String date;

  PublishedDate({this.date});

  PublishedDate.fromJson(Map<String, dynamic> json) {
    date = json['$date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$date'] = this.date;
    return data;
  }
}
