import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';

part 'drift_database_service.g.dart';

@DriftDatabase(tables: []) // Add your tables here
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1; // Increment this when your schema changes
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFile = File('db.sqlite');
    return NativeDatabase(dbFile);
  });
}