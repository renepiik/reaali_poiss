import 'article.dart';
import 'dart:collection';
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'dart:convert' as json;
import 'package:http/http.dart' as http;
import 'package:reaali_poiss/json_parsing.dart';
import 'package:flutter/material.dart';

class InheritedBloc extends InheritedWidget {
  final RPBloc bloc;

  InheritedBloc({Widget child, this.bloc}) : super(child : child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static InheritedBloc of(BuildContext context) => context.inheritFromWidgetOfExactType(InheritedBloc);
}

class RPBloc {
  // frontpage articles stream
  final _frontpageSubject = BehaviorSubject<UnmodifiableListView<Article>>();
  var _frontpageArticles = <Article>[];
  Stream<UnmodifiableListView<Article>> get frontpageArticles => _frontpageSubject.stream;

  // edition articles stream
  final _editionSubject = BehaviorSubject<UnmodifiableListView<Article>>();
  var _editionArticles = <Article>[];
  Stream<UnmodifiableListView<Article>> get editionArticles => _editionSubject.stream;

  final _editionIdController = StreamController<int>();
  Sink<int> get editionId => _editionIdController.sink;

  RPBloc() {
    _getFrontpageArticles().then((_) {
      _frontpageSubject.add(UnmodifiableListView(_frontpageArticles));
    });

    _editionIdController.stream.listen((editionId) {
      _getEditionArticles(editionId).then((_) {
        _editionSubject.add(UnmodifiableListView(_editionArticles));
      });
    });
  }

  // returns articles of given list of ids
  Future<Null> _getFrontpageArticles() async {
    List<int> _ids = await fetchLatestIds();
    final futureArticles = _ids.map((id) => _getArticle(id));
    final articles = await Future.wait(futureArticles);
    _frontpageArticles =  articles;
  }

  Future<Null> _getEditionArticles(int editionId) async {
    List<int> _ids = await fetchEditionIds(editionId);
    final futureArticles = _ids.map((id) => _getArticle(id));
    final articles = await Future.wait(futureArticles);
    _editionArticles =  articles;
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