import 'package:flutter/material.dart';

import '../../../Model/brand.dart';
import '../helper/db_helper.dart';
import '../helper/result_state.dart';

class DatabaseProvider extends ChangeNotifier {
  final DatabaseHelper databaseHelper;

  DatabaseProvider({required this.databaseHelper}) {
    _getFavorite();
  }

  late ResultState _state;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  List<Brand> _favorite = [];
  List<Brand> get bookmarks => _favorite;

  void _getFavorite() async {
    _favorite = await databaseHelper.getBookmarks();
    if (_favorite.isNotEmpty) {
      _state = ResultState.HasData;
    } else {
      _state = ResultState.NoData;
      _message = 'Empty Data';
    }
    notifyListeners();
  }

  void addBookmark(Brand article) async {
    print(article);
    try {
      await databaseHelper.insertBookmark(article);
      _getFavorite();
    } catch (e) {
      _state = ResultState.Error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  Future<bool> isBookmarked(int id) async {
    final bookmarkedArticle = await databaseHelper.getFavoritekById(id);
    return bookmarkedArticle.isNotEmpty;
  }

  void removeBookmark(int id) async {
    try {
      await databaseHelper.removeFavorite(id);
      _getFavorite();
    } catch (e) {
      _state = ResultState.Error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }
}
