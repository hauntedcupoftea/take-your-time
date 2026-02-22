import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

enum DayState {
  ob1,
  ft1,
  ob2,
  ft2,
  rst;

  DayState next() {
    return DayState.values[(index + 1) % DayState.values.length];
  }
}

enum CallingCardStatus { active, complete, abandoned, retry }

enum StatDifficulty { easy, medium, hard, expert }

class TimeBlocks extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get blockType => intEnum<DayState>()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime().nullable()();

  TextColumn get activity => text().nullable()();
  IntColumn get minimumCommitmentMinutes => integer().nullable()();
  IntColumn get statId => integer().nullable().references(
    PersonalStats,
    #id,
    onDelete: KeyAction.setNull,
  )();
  IntColumn get callingCardId => integer().nullable().references(
    CallingCards,
    #id,
    onDelete: KeyAction.setNull,
  )();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class PersonalStats extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();
  IntColumn get totalMinutes => integer().withDefault(const Constant(0))();
  IntColumn get difficulty => intEnum<StatDifficulty>()();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  DateTimeColumn get archivedAt => dateTime().nullable()();
  TextColumn get archiveReason => text().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class StatRankNames extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get statId =>
      integer().references(PersonalStats, #id, onDelete: KeyAction.cascade)();

  IntColumn get rankNumber => integer()(); // 0-5
  TextColumn get rankName => text()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {statId, rankNumber},
  ];
}

class CallingCards extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();
  TextColumn get description => text()();
  DateTimeColumn get deadline => dateTime()();

  IntColumn get status => intEnum<CallingCardStatus>()();
  IntColumn get totalMinutesInvested =>
      integer().withDefault(const Constant(0))();
  TextColumn get reflectionNotes => text().nullable()();
  TextColumn get abandonmentReason => text().nullable()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  DateTimeColumn get abandonedAt => dateTime().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class CallingCardObjectives extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get callingCardId =>
      integer().references(CallingCards, #id, onDelete: KeyAction.cascade)();

  TextColumn get description => text()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  IntColumn get sortOrder => integer()();

  DateTimeColumn get completedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(
  tables: [
    TimeBlocks,
    PersonalStats,
    StatRankNames,
    CallingCards,
    CallingCardObjectives,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'take_your_time',
      native: const DriftNativeOptions(shareAcrossIsolates: true),
    );
  }
}
