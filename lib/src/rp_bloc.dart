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
  // for caching articles while app is running
  HashMap<int, Article> _cachedArticles;

  // isLoading stream
  final _isLoadingSubject = BehaviorSubject<bool>();
  Stream<bool> get isLoading => _isLoadingSubject.stream;

  // frontpage articles stream
  final _frontpageSubject = BehaviorSubject<UnmodifiableListView<Article>>();
  var _frontpageArticles = <Article>[];
  Stream<UnmodifiableListView<Article>> get frontpageArticles => _frontpageSubject.stream;

  // refresh frontpage sink
  final _frontpageRefreshController = StreamController<bool>();
  Sink<bool> get frontpageRefresh => _frontpageRefreshController.sink;

  // edition articles stream
  final _editionSubject = BehaviorSubject<UnmodifiableListView<Article>>();
  var _editionArticles = <Article>[];
  Stream<UnmodifiableListView<Article>> get editionArticles => _editionSubject.stream;

  // edition id sink
  final _editionIdController = StreamController<int>();
  Sink<int> get editionId => _editionIdController.sink;
  
  void dispose() { 
    _editionIdController.close();
    _frontpageRefreshController.close();
  }

  RPBloc() {
    _cachedArticles = HashMap<int, Article>();

    frontpage() {
      _getFrontpageArticles().then((_) {
        _frontpageSubject.add(UnmodifiableListView(_frontpageArticles));
        _isLoadingSubject.add(false);
      });
    }

    frontpage();
    _frontpageRefreshController.stream.listen((frontpageRefresh) {
      frontpage();
    });

    _editionIdController.stream.listen((editionId) {
      try {
        _getEditionArticles(editionId).then((_) {
          _editionSubject.add(UnmodifiableListView(_editionArticles));
          _isLoadingSubject.add(false);
        });
      } catch (e) {
        _editionSubject.add(UnmodifiableListView([]));
        _isLoadingSubject.add(false);
      }
    });
  }

  // returns frontpage articles
  Future<Null> _getFrontpageArticles() async {
    _isLoadingSubject.add(true);
    List<int> _ids = await fetchLatestIds();
    final futureArticles = _ids.map((id) => _getArticle(id));
    final articles = await Future.wait(futureArticles);
    _frontpageArticles = articles;
  }

  // returns articles of given list of ids
  Future<Null> _getEditionArticles(int editionId) async {
    _isLoadingSubject.add(true);
    List<int> _ids = await fetchEditionIds(editionId);
    final futureArticles = _ids.map((id) => _getArticle(id));
    final articles = await Future.wait(futureArticles);
    _editionArticles =  articles;
  }

  // returns article of given id
  Future<Article> _getArticle(int id) async {
    if (!_cachedArticles.containsKey(id)) {
      final url = 'http://rene.piik.eu/api/article/read_one.php?id='+id.toString();
      final res = await http.get(url);

      if (res.statusCode == 200) {
        // if server returns OK response
        _cachedArticles[id] = parseArticle(res.body);

      } else {
        throw Exception('Failed to load');
      }
    }

    return _cachedArticles[id];
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
      return <int>[];
    }
  }
}