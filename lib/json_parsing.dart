import 'dart:convert' as json;
import 'src/article.dart';

Article parseArticle(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);
  Article article = Article.fromJson(parsed);
  return article;
}