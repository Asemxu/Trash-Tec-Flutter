import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/home_content.dart';

class HomeContentService {
  Future<Map<String, dynamic>> loadJsonData() async {
    final String response = await rootBundle.loadString('assets/db.json');
    return json.decode(response);
  }

  Future<List<RecyclingFact>> getFacts() async {
    final data = await loadJsonData();
    return (data['facts'] as List)
        .map((fact) => RecyclingFact.fromJson(fact))
        .toList();
  }

  Future<List<Category>> getCategories() async {
    final data = await loadJsonData();
    return (data['categories'] as List)
        .map((category) => Category.fromJson(category))
        .toList();
  }

  Future<List<Benefit>> getBenefits() async {
    final data = await loadJsonData();
    return (data['benefits'] as List)
        .map((benefit) => Benefit.fromJson(benefit))
        .toList();
  }

  Future<List<RecyclingReason>> getReasons() async {
    final data = await loadJsonData();
    return (data['reasons'] as List)
        .map((reason) => RecyclingReason.fromJson(reason))
        .toList();
  }
}