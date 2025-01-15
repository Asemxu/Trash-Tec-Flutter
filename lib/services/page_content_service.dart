import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/page_content.dart';

class PageContentService {
  Future<List<PageContent>> fetchPageContents() async {
    final response = await rootBundle.loadString('assets/db.json');
    final data = json.decode(response);
    return parsePageContents(data['page_contents']);
  }

  List<PageContent> parsePageContents(List<dynamic> jsonList) {
    return jsonList.map<PageContent>((json) => PageContent.fromJson(json)).toList();
  }
}
