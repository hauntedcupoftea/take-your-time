import 'package:drift/drift.dart';
import 'package:take_your_time/data/database.dart';

class TimeBlockRepository {
  final AppDatabase _db;

  TimeBlockRepository(this._db);

  // Basic Queries

  Future<TimeBlock?> getCurrentBlock() async {
    return await (_db.select(_db.timeBlocks)
          ..where((t) => t.endTime.isNull())
          ..orderBy([(t) => OrderingTerm.desc(t.startTime)])
          ..limit(1))
        .getSingleOrNull();
  }

  Stream<TimeBlock?> watchCurrentBlock() {
    return (_db.select(_db.timeBlocks)
          ..where((t) => t.endTime.isNull())
          ..orderBy([(t) => OrderingTerm.desc(t.startTime)])
          ..limit(1))
        .watchSingleOrNull();
  }

  Future<List<TimeBlock>> getBlocksForDate(DateTime date) async {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));

    return await (_db.select(_db.timeBlocks)
          ..where((t) => t.startTime.isBiggerOrEqualValue(start))
          ..where((t) => t.startTime.isSmallerThanValue(end))
          ..orderBy([(t) => OrderingTerm.asc(t.startTime)]))
        .get();
  }

  Future<List<TimeBlock>> getBlocksForDateRange(
    DateTime start,
    DateTime end,
  ) async {
    return await (_db.select(_db.timeBlocks)
          ..where((t) => t.startTime.isBiggerOrEqualValue(start))
          ..where((t) => t.startTime.isSmallerThanValue(end))
          ..orderBy([(t) => OrderingTerm.asc(t.startTime)]))
        .get();
  }

  // Core actions

  Future<void> transitionToNextBlock({
    String? activity,
    int? statId,
    int? callingCardId,
    int? commitmentMinutes,
  }) async {
    final current = await getCurrentBlock();
    final now = DateTime.now();

    // End current block if it exists
    if (current != null) {
      final duration = now.difference(current.startTime).inMinutes;

      await (_db.update(
        _db.timeBlocks,
      )..where((t) => t.id.equals(current.id))).write(
        TimeBlocksCompanion(
          endTime: Value(now),
          activity: Value(activity),
          statId: Value(statId),
          callingCardId: Value(callingCardId),
        ),
      );

      if (statId != null && duration > 0) {
        await _updateStatMinutes(statId, duration);
      }
      if (callingCardId != null && duration > 0) {
        await _updateCardMinutes(callingCardId, duration);
      }
    }

    final nextState = current?.blockType.next() ?? DayState.ob1;

    await _db
        .into(_db.timeBlocks)
        .insert(
          TimeBlocksCompanion.insert(
            blockType: nextState,
            startTime: now,
            minimumCommitmentMinutes: Value(commitmentMinutes),
          ),
        );
  }

  Future<void> startNewDay() async {
    final current = await getCurrentBlock();
    if (current != null) {
      await (_db.update(_db.timeBlocks)..where((t) => t.id.equals(current.id)))
          .write(TimeBlocksCompanion(endTime: Value(DateTime.now())));
    }

    await _db
        .into(_db.timeBlocks)
        .insert(
          TimeBlocksCompanion.insert(
            blockType: DayState.ob1,
            startTime: DateTime.now(),
          ),
        );
  }

  // Insights & Patterns

  Future<Map<DayState, int>> getBlockTypeDistribution(
    DateTime start,
    DateTime end,
  ) async {
    final blocks = await getBlocksForDateRange(start, end);
    final distribution = <DayState, int>{};

    for (final block in blocks) {
      if (block.endTime != null) {
        final duration = block.endTime!.difference(block.startTime).inMinutes;
        distribution[block.blockType] =
            (distribution[block.blockType] ?? 0) + duration;
      }
    }

    return distribution;
  }

  Future<int> getTotalMinutesForBlockType(
    DayState type,
    DateTime start,
    DateTime end,
  ) async {
    final blocks = await getBlocksForDateRange(start, end);
    int total = 0;

    for (final block in blocks) {
      if (block.blockType == type && block.endTime != null) {
        total += block.endTime!.difference(block.startTime).inMinutes;
      }
    }

    return total;
  }

  Future<List<TimeBlock>> getUnallocatedBlocks(
    DateTime start,
    DateTime end,
  ) async {
    return await (_db.select(_db.timeBlocks)
          ..where((t) => t.startTime.isBiggerOrEqualValue(start))
          ..where((t) => t.startTime.isSmallerThanValue(end))
          ..where((t) => t.statId.isNull())
          ..where((t) => t.callingCardId.isNull())
          ..where((t) => t.endTime.isNotNull())
          ..orderBy([(t) => OrderingTerm.asc(t.startTime)]))
        .get();
  }

  Future<List<TimeBlock>> getBlocksForStat(
    int statId,
    DateTime start,
    DateTime end,
  ) async {
    return await (_db.select(_db.timeBlocks)
          ..where((t) => t.startTime.isBiggerOrEqualValue(start))
          ..where((t) => t.startTime.isSmallerThanValue(end))
          ..where((t) => t.statId.equals(statId))
          ..orderBy([(t) => OrderingTerm.asc(t.startTime)]))
        .get();
  }

  Future<List<TimeBlock>> getBlocksForCallingCard(
    int cardId,
    DateTime start,
    DateTime end,
  ) async {
    return await (_db.select(_db.timeBlocks)
          ..where((t) => t.startTime.isBiggerOrEqualValue(start))
          ..where((t) => t.startTime.isSmallerThanValue(end))
          ..where((t) => t.callingCardId.equals(cardId))
          ..orderBy([(t) => OrderingTerm.asc(t.startTime)]))
        .get();
  }

  // helpers (private)
  Future<void> _updateStatMinutes(int statId, int minutes) async {
    final stat = await (_db.select(
      _db.personalStats,
    )..where((s) => s.id.equals(statId))).getSingleOrNull();

    if (stat != null) {
      await (_db.update(
        _db.personalStats,
      )..where((s) => s.id.equals(statId))).write(
        PersonalStatsCompanion(
          totalMinutes: Value(stat.totalMinutes + minutes),
        ),
      );
    }
  }

  Future<void> _updateCardMinutes(int cardId, int minutes) async {
    final card = await (_db.select(
      _db.callingCards,
    )..where((c) => c.id.equals(cardId))).getSingleOrNull();

    if (card != null) {
      await (_db.update(
        _db.callingCards,
      )..where((c) => c.id.equals(cardId))).write(
        CallingCardsCompanion(
          totalMinutesInvested: Value(card.totalMinutesInvested + minutes),
        ),
      );
    }
  }
}
