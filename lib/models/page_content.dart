import 'dart:convert';

class PageContent {
  final String imagePath;
  final String title;
  final String description;

  PageContent({
    required this.imagePath,
    required this.title,
    required this.description,
  });

  factory PageContent.fromJson(Map<String, dynamic> json) {
    return PageContent(
      imagePath: json['imagePath'],
      title: json['title'],
      description: json['description'],
    );
  }
}
