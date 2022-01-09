import 'package:chairs_factory/data/database/database/database.dart';
import 'package:chairs_factory/data/models/chiars/chair.dart';

class DatabaseRepository {
  static final AppDatabase _database = AppDatabase();

  static ChiarDao? chairDao;

  initDb() async {
    await _database.database;
    chairDao = _database.chiarDao;
  }

  // Chiar
  Future<List<Chair>?>? findAllChiar() async => await chairDao!.findAllChiars();
  Future<Chair?>? findChiar(int id) async => await chairDao!.findChiar(id);
  Future<Chair?>? insertChiar(Chair chiar) async =>
      await chairDao!.insert(chiar);
  Future<Chair?>? updateChiar(Chair chiar) async =>
      await chairDao!.update(chiar);
  Future<int> deleteChiar(int id) async => await chairDao!.delete(id);
}
