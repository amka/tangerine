import 'dart:convert';
import 'dart:io';

import 'package:logger/logger.dart';

import "../models/item.dart";
import '../../utils/result.dart';

class HackernewsService {
  final log = Logger();

  final String _host = 'https://hacker-news.firebaseio.com/v0';
  final HttpClient Function() _clientFactory;

  HackernewsService({HttpClient Function()? clientFactory})
    : _clientFactory = clientFactory ?? (() => HttpClient());

  /// Fetches the list of top story IDs from Hacker News.
  ///
  /// Returns a [Result] containing either the list of story IDs or an error.
  Future<Result<List<int>>> getTopStories() async {
    final client = _clientFactory();

    final url = Uri.parse('$_host/topstories.json');
    try {
      final request = await client.getUrl(url);
      final response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        final stringData = await response.transform(utf8.decoder).join();
        final json = jsonDecode(stringData) as List<dynamic>;
        return Result.ok(List<int>.from(json));
      } else {
        log.e('Failed to best top stories');
        return const Result.error(HttpException("Invalid response"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  /// Fetches the list of new story IDs from Hacker News.
  ///
  /// Returns a [Result] containing either the list of story IDs or an error.
  Future<Result<List<int>>> getNewStories() async {
    final client = _clientFactory();

    final url = Uri.parse('$_host/newstories.json');
    try {
      final request = await client.getUrl(url);
      final response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        final stringData = await response.transform(utf8.decoder).join();
        final json = jsonDecode(stringData) as List<dynamic>;
        return Result.ok(List<int>.from(json));
      } else {
        log.e('Failed to new stories');
        return const Result.error(HttpException("Invalid response"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  /// Fetches the list of best story IDs from Hacker News.
  ///
  /// Returns a [Result] containing either the list of story IDs or an error.
  Future<Result<List<int>>> getBestStories() async {
    final client = _clientFactory();

    final url = Uri.parse('$_host/beststories.json');
    try {
      final request = await client.getUrl(url);
      final response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        final stringData = await response.transform(utf8.decoder).join();
        final json = jsonDecode(stringData) as List<dynamic>;
        return Result.ok(List<int>.from(json));
      } else {
        log.e('Failed to load best stories');
        return const Result.error(HttpException("Invalid response"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  /// Fetches a single item from the Hacker News API.
  ///
  /// Returns a [Result] object containing either the fetched [Item] or an error.
  Future<Result<Item>> getItem(int id) async {
    final client = _clientFactory();
    try {
      final url = Uri.parse('$_host/item/$id.json');
      final request = await client.getUrl(url);
      final response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        final stringData = await response.transform(utf8.decoder).join();
        final json = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(Item.fromJson(json));
      } else {
        log.e('Failed to load item with id $id');
        return const Result.error(HttpException("Invalid response"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }
}
