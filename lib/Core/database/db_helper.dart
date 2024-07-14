import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_application_1/Features/Search/getx/Search_controller.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBhelper {
  Future initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "db.sqlite");

    final exist = await databaseExists(path);

    if (exist) {
    } else {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
      ByteData data =
          await rootBundle.load(join("assets/database", "db.sqlite"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }
    return openDatabase(path);
  }

  Future<List<Map<String, dynamic>>> getCat() async {
    Database db = await initDb();
    return db.query(
      'articlesgroups',
    );
  }

  Future<List<Map<String, dynamic>>> getArticle(int id) async {
    Database db = await initDb();

    // Query the articlesgroups table
    List<Map<String, dynamic>> articleGroups = await db.query(
      'articles',
      where: 'groupId = ?',
      whereArgs: [id],
    );

    return articleGroups;
  }

  Future<List<Map<String, dynamic>>> getNewContent(int id) async {
    Database db = await initDb();
    return db.query('articles', where: 'groupId = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getRealArticle(int id) async {
    Database db = await initDb();
    return db.query('articles', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getSearch(String textSearch,
      {required SearchEnum searchEnum}) async {
    Database db = await initDb();
    String query = "SELECT * FROM articles WHERE _text LIKE '%$textSearch%'";
    switch (searchEnum) {
      case SearchEnum.title:
        query = "SELECT * FROM articles WHERE title LIKE '%$textSearch%'";

        break;
      case SearchEnum.content:
        query = "SELECT * FROM articles WHERE _text LIKE '%$textSearch%'";

      case SearchEnum.both:
        query =
            "SELECT * FROM articles WHERE title LIKE '%$textSearch%' OR _text LIKE '%$textSearch%'";
      default:
    }
    return db.rawQuery(query);
  }

  Future<List<Map<String, dynamic>>> getAllsave() async {
    Database db = await initDb();
    return db.query(
      'bookmark',
    );
  }

  Stream<List<Map<String, dynamic>>> getAllsaveStream() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield await getAllsave();
    }
  }

  insertArticle(
      {required String title, required int id, required String text}) async {
    Database db = await initDb();
    db.insert("bookmark", {
      "id": id,
      "_text": text,
      "title": title,
    });
  }

  deleteArticle({
    required int id,
  }) async {
    Database db = await initDb();
    db.delete("bookmark", where: "id = ?", whereArgs: [id]);
  }
}
