import 'package:http/http.dart';
import 'package:newapi/model/artical_model.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'dart:async';

class ApiService {
  final endPointUrl =Uri.parse("https://newsapi.org/v2/everything?q=tesla&from=2023-01-08&sortBy=publishedAt&apiKey=dd40b7b612e84f6593d76b6fcd8f6e5d");
  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles']; 
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}










// class ApiService {
//   final endPointUrl =
//       "https://newsapi.org/v2/everything?q=keyword&apiKey=dd40b7b612e84f6593d76b6fcd8f6e5d";

//   Future<List<Article>> NewsApi() async {
//     Response res = await get(endPointUrl);
//   }
// }
