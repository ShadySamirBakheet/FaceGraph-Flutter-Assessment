part of '../database/database.dart';

class ChiarDao {
  Future<List<Chair>?>? findAllChiars() async {
    List<Map<String, dynamic>> maps =
        await AppDatabase._db!.query(AppDatabase.chiarName);
    List<Chair> items = [];
    if (maps.isNotEmpty) {
      for (var item in maps) {
        items.add(Chair.fromMap(item));
      }

      return items;
    }
    return null;
  }

  Future<Chair?> findChiar(int id) async {
    List<Map<String, dynamic>> maps = await AppDatabase._db!
        .query(AppDatabase.chiarName, where: 'id = ?', whereArgs: [id]);
    List<Chair> items = [];
    if (maps.isNotEmpty) {
      for (var item in maps) {
        items.add(Chair.fromMap(item));
      }
      return items.first;
    }
    return null;
  }

  Future<Chair?> insert(Chair chiar) async {
    chiar.id =
        await AppDatabase._db!.insert(AppDatabase.chiarName, chiar.toMap());
    return chiar;
  }

  Future<int> delete(int id) async {
    return await AppDatabase._db!
        .delete(AppDatabase.chiarName, where: 'id = ?', whereArgs: [id]);
  }

  Future<Chair?> update(Chair chiar) async {
    int updated = await AppDatabase._db!.update(
        AppDatabase.chiarName, chiar.toMap(),
        where: 'id = ?', whereArgs: [chiar.id]);
    return (updated == 1) ? chiar : null;
  }
}
