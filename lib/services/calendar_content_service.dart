import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/calendar_content.dart';

class CalendarContentService {
  Future<Map<String, dynamic>> loadJsonData() async {
    final String response = await rootBundle.loadString('assets/db.json');
    return json.decode(response);
  }

  Future<List<CollectionCenter>> getCollectionCenters() async {
    final data = await loadJsonData();
    return (data['collectionCenters'] as List)
        .map((fact) => CollectionCenter.fromJson(fact))
        .toList();
  }

  Future<PickUpDate> getPickUpDate() async {
    final data = await loadJsonData();
    return PickUpDate.fromJson(data['pickUpDate']);
  }
    
}