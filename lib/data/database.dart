// lib/data/database.dart
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class TimeBlocks extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get type => integer()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime().nullable()();
  TextColumn get activity => text().nullable()();
  IntColumn get minimumCommitmentMinutes => integer().nullable()();
}

class CallingCards extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  DateTimeColumn get deadline => dateTime()();
  IntColumn get status => integer()();
  TextColumn get reflectionNotes => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
}

class PersonalStats extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get activityCount => integer().withDefault(const Constant(0))();
}

@DriftDatabase(tables: [TimeBlocks, CallingCards, PersonalStats])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'take_your_time.sqlite'));
    return NativeDatabase(file);
  });
}
