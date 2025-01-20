import 'package:logger/logger.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../models/item.dart';

class DbService {
  static const _tableName = 'items';

  final log = Logger();
  late final Database db;

  DbService() {
    init();
  }

  /// Initialize the database.
  ///
  /// This method will create the database if it doesn't exist
  /// and create the table if it doesn't exist.
  Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'tangerine.db');
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (newDb, version) {
        newDb.execute("""
         CREATE TABLE IF NOT EXISTS $_tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            deleted INTEGER,
            type TEXT,
            by TEXT,
            time INTEGER,
            text TEXT,
            dead INTEGER,
            kids BLOB,
            score INTEGER,
            title TEXT,
            url TEXT,
            descendants INTEGER
         )""");
      },
    );
  }

  /// Fetch an [Item] by its id.
  ///
  /// This method will fetch an [Item] from the database by its id.
  /// If no [Item] is found with the given id, it will return `null`.
  Future<Item?> fetchItem(int id) async {
    try {
      final result = await db.query(
        _tableName,
        where: 'id = ?',
        whereArgs: [id],
      );

      if (result.isEmpty) log.d('No item found with id $id');

      log.d('Found item with id $id');
      return Item.fromRow(result.first);
    } catch (e) {
      log.e('Error fetching item $id: $e');
    }

    return null;
  }

  /// Add an [Item] to the database.
  ///
  /// This method will add a new [Item] to the database. If the [Item] already exists,
  /// it will not be added again.
  Future<void> addItem(Item item) async {
    try {
      await db.insert(_tableName, item.toRow());
      log.d('Added item with id ${item.id}');
    } catch (e) {
      log.e('Error adding item: $e');
    }
  }
}
