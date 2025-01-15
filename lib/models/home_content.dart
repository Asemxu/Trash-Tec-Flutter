import 'package:flutter/material.dart';

class RecyclingFact {
  final String title;
  final String description;
  final String imageUrl;
  RecyclingFact({required this.title, required this.description, required this.imageUrl});

  factory RecyclingFact.fromJson(Map<String, dynamic> json) {
    return RecyclingFact(
      imageUrl: json['imageUrl'],
      title: json['title'],
      description: json['description'],
    );
  }
}

class Category {
  final String name;
  final String icon;
  final String description;
  Category({required this.name, required this.icon, required this.description});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      description: json['description'],
      name: json['name'],
      icon: json['icon'],
    );
  }
}

class Benefit {
  final String title;
  final String description;
  final String imageUrl;
  Benefit({required this.title, required this.description, required this.imageUrl});
  factory Benefit.fromJson(Map<String, dynamic> json) {
    return Benefit(
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }
}

class RecyclingReason {
  final String title;
  final String description;
  final String imageUrl;
  RecyclingReason({required this.title, required this.description, required this.imageUrl});

  factory RecyclingReason.fromJson(Map<String, dynamic> json) {
    return RecyclingReason(
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }
}

class HomeScreenData {
  final List<RecyclingFact> facts;
  final List<Category> categories;
  final List<Benefit> benefits;
  final List<RecyclingReason> reasons;

  HomeScreenData({
    required this.facts,
    required this.categories,
    required this.benefits,
    required this.reasons,
  });
}