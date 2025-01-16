import 'package:flutter/material.dart';

class PickUpDate {
  final String date;
  PickUpDate({required this.date});

  factory PickUpDate.fromJson(Map<String, dynamic> json) {
    return PickUpDate(
      date: json['date'],
    );
  }
}

class CollectionCenter {
  final String id;
  final String address;
  final String name;
  final String imageUrl;

CollectionCenter({required this.id, required this.address, required this.name, required this.imageUrl});

  factory CollectionCenter.fromJson(Map<String, dynamic> json) {
    return CollectionCenter(
      id: json['id'],
      address: json['address'],
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }
}

class CalendarScreenData {
  final List<CollectionCenter> collectionCenters;
  final PickUpDate pickUpDate;

  CalendarScreenData({
    required this.collectionCenters,
    required this.pickUpDate,
  });
}