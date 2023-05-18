import 'package:flutter/material.dart';
import 'package:mansoor_assessment/models/article_model.dart';
import 'package:mansoor_assessment/services/api_services.dart';

class ArticlesProvider extends ChangeNotifier {
  Articles? _articles;

  Articles? get articles => _articles;

  Future<void> fetchMostPopularArticles() async {
    try {
      _articles = await ApiCall().fetchMostPopularArticles();
      notifyListeners();
    } catch (error) {
      throw error.toString();
    }
  }
}
