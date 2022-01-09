import 'package:chairs_factory/data/models/chiars/chair.dart';

import 'package:sqflite/sqflite.dart';

part '../dao/dao_chiar.dart';

class AppDatabase {
  static Database? _db;
  String? _path;

  static String chiarName = 'chiars';

  Future get database async {
    if (_db == null) {
      open(await path);
    }

    ///return _db!;
  }

  Future<String> get path async {
    var databasesPath = await getDatabasesPath();
    _path = join(databasesPath, 'chairs.db');
    return _path ?? '';
  }

  Future<Database> open(String path) async {
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          '''CREATE TABLE "$chiarName" (
                  "id"	INTEGER NOT NULL,
                  "title"	TEXT NOT NULL,
                  "picture"	TEXT,
                  "description"	TEXT,
                  "createDate"	TEXT,
                  "status"	INTEGER,
                  PRIMARY KEY("id" AUTOINCREMENT)
            );''',
        );
      },
    );

    return _db!;
  }

  Future close() async => _db!.close();

  ChiarDao get chiarDao => ChiarDao();

  String join(String databasesPath, String databasesName) {
    return '$databasesPath/$databasesName';
  }
}


/*
'''BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "UserEntity" ("uid"	INTEGER,"name"	TEXT,"uImage"	TEXT,"phone"	TEXT,"email"	TEXT,"address"	TEXT,"isTeacher"	INTEGER,PRIMARY KEY("uid"));
CREATE TABLE IF NOT EXISTS "PinnedSlideEntity" ("id"	INTEGER,"uId"	TEXT,"lecId"	TEXT,"slideContant"	TEXT,"isPinned"	INTEGER,PRIMARY KEY("id"));
CREATE TABLE IF NOT EXISTS "PinnedLectureEntity" ("id"	INTEGER,"uId"	TEXT,"lecId"	TEXT,PRIMARY KEY("id"));
CREATE TABLE IF NOT EXISTS "LectureEntity" ("id"	INTEGER,"lecName"	TEXT,"lecDescription"	TEXT,"lecFullDescription"	TEXT,"lecCreatorId"	TEXT,"lecCreatorName"	TEXT,"lecIamge"	TEXT,"rate"	INTEGER,PRIMARY KEY("id"));
CREATE TABLE IF NOT EXISTS "LectureAnswerEntity" ("id"	INTEGER,"uId"	TEXT,"lecId"	TEXT,"question"	TEXT,"answer"	TEXT,"rightAnswer"	TEXT,PRIMARY KEY("id"));
CREATE TABLE IF NOT EXISTS "CourseEntity" ("id"	INTEGER,"courseName"	TEXT,"courseDescription"	TEXT,"courseFullDescription"	TEXT,"courseCreatorId"	TEXT,"courseCreatorName"	TEXT,"courseIamge"	TEXT,"courseCategory"	TEXT,"rate"	INTEGER,PRIMARY KEY("id"));
CREATE TABLE IF NOT EXISTS "CategoryEntity" ("id"	INTEGER,"catName"	TEXT,"catDescription"	TEXT,"catFullDescription"	TEXT,"catCreatorId"	TEXT,"catCreatorName"	TEXT,"catIamge"	TEXT,PRIMARY KEY("id"));
COMMIT;
'''
*/
