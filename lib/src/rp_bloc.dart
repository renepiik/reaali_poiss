import 'article.dart';
import 'dart:collection';
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'dart:convert' as json;
import 'package:http/http.dart' as http;
import 'package:reaali_poiss/json_parsing.dart';
import 'package:flutter/material.dart';

enum StoriesType {
  newStories,
  editionStories
}

class InheritedBloc extends InheritedWidget {
  final RPBloc bloc;

  InheritedBloc({Widget child, this.bloc}) : super(child : child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static InheritedBloc of(BuildContext context) => context.inheritFromWidgetOfExactType(InheritedBloc);
}

class RPBloc {
  final _articleSubject = BehaviorSubject<UnmodifiableListView<Article>>();
  final _storiesTypeController = StreamController<StoriesType>();

  Sink<StoriesType> get storiesType => _storiesTypeController.sink;
  Stream<UnmodifiableListView<Article>> get articles => _articleSubject.stream;

  var _articles = <Article>[];

  RPBloc() {
    _storiesTypeController.stream.listen((storiesType) {
      if (storiesType == StoriesType.newStories) {
        _getArticlesAndUpdate(StoriesType.newStories);
      } else {
        _getArticlesAndUpdate(StoriesType.editionStories, editionId: 157);
      }
    });
  }

  _getArticlesAndUpdate(StoriesType storiesType, {int editionId}) async {
    List<int> ids;
    if (storiesType == StoriesType.newStories) {
      ids = await fetchLatestIds();
      _getArticles(ids).then((_) {
        _articleSubject.add(UnmodifiableListView(_articles));
      });
    } else {
      ids = await fetchEditionIds(editionId);
      _getArticles(ids).then((_) {
        _articleSubject.add(UnmodifiableListView(_articles));
      });
    }
  }

  // returns articles of given list of ids
  Future<Null> _getArticles(List<int> _ids) async {
    final futureArticles = _ids.map((id) => _getArticle(id));
    final articles = await Future.wait(futureArticles);
    _articles =  articles;
  }

  // returns article of given id
  Future<Article> _getArticle(int id) async {
    final url = 'http://rene.piik.eu/api/article/read_one.php?id='+id.toString();
    final res = await http.get(url);

    if (res.statusCode == 200) {
      // if server returns OK response
      return parseArticle(res.body);

    } else {
      throw Exception('Failed to load');
    }
  }

  // returns list of all articles in order of latest -> oldest
  Future<List<int>> fetchLatestIds() async {
    final url = 'http://rene.piik.eu/api/article/read.php';
    final res = await http.get(url);

    if (res.statusCode == 200) {
      // if server returns OK response
      final latestJson = json.jsonDecode(res.body);
      List<int> latestIds = [];

      for (int i = 0; i < latestJson.length; i++) {
        latestIds.add(latestJson[i]);
      }

      return latestIds;
    } else {
      throw Exception('Failed to load');
    }
  }

  // returns list of articles in given edition
  Future<List<int>> fetchEditionIds(int editionId) async {
    final url = 'http://rene.piik.eu/api/article/read_edition.php?id='+editionId.toString();
    final res = await http.get(url);

    if (res.statusCode == 200) {
      // if server returns OK response
      final editionJson = json.jsonDecode(res.body);
      List<int> editionIds = [];

      for (int i = 0; i < editionJson.length; i++) {
        editionIds.add(editionJson[i]);
      }

      return editionIds;
    } else {
      throw Exception('Failed to load');
    }
  }
}