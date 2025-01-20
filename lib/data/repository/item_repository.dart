import 'package:logger/logger.dart';

import '../models/item.dart';
import '../services/db_service.dart';
import '../services/hackernews_service.dart';
import '../../utils/result.dart';

/// Repository class for handling item-related operations.
class ItemRepository {
  final hackerNews = HackernewsService();
  final dbService = DbService();
  final log = Logger();

  Future<List<int>> fetchTopIds() async {
    final result = await hackerNews.getTopStories();
    switch (result) {
      case Ok<List<int>>():
        return result.value;
      case Error<List<int>>():
        log.e('Failed to fetch top stories: ${result.error}');
        return [];
    }
  }

  Future<Item?> fetchItem(int id) async {
    // try to get Item from database first
    final item = await dbService.fetchItem(id);
    if (item != null) {
      return item;
    }

    // if item not found in db, fetch from api and save to db
    final result = await hackerNews.getItem(id);
    switch (result) {
      case Ok<Item>():
        // Save the fetched Item to database and return it
        dbService.addItem(result.value);
        return result.value;
      case Error<Item>():
        log.e('Failed to fetch item with id $id: ${result.error}');
        return null;
    }
  }
}
