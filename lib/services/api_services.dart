import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mansoor_assessment/models/article_model.dart';

class ApiCall {
  static const String apiKey = 'Rg0kOSlA62ELcEFANEJll6xKQByDAmQR';

  Future<Articles> fetchMostPopularArticles() async {
    const String baseUrl = "api.nytimes.com";

    Map<String, String> parameters = {
      'api-key': apiKey,
    };
    Uri uri = Uri.https(baseUrl, 'svc/mostpopular/v2/viewed/1.json', parameters);
    try {
      var response = await http.get(uri);
      Map<String, dynamic> data = json.decode(response.body);
      Articles articlesCopy = Articles.fromJson(data);
      return articlesCopy;
    } catch (err) {
      throw err.toString();
    }
  }
}
