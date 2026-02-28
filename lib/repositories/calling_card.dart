import 'package:drift/drift.dart';
import '../data/database.dart';

class CallingCardRepository {
  final AppDatabase _db;

  CallingCardRepository(this._db);

  Future<List<CallingCard>> getActiveCards() async {
    return await (_db.select(_db.callingCards)
          ..where((c) => c.status.equalsValue(CallingCardStatus.active))
          ..orderBy([(c) => OrderingTerm.asc(c.deadline)]))
        .get();
  }

  Stream<List<CallingCard>> watchActiveCards() {
    return (_db.select(_db.callingCards)
          ..where((c) => c.status.equalsValue(CallingCardStatus.active))
          ..orderBy([(c) => OrderingTerm.asc(c.deadline)]))
        .watch();
  }

  Future<List<CallingCard>> getCompletedCards() async {
    return await (_db.select(_db.callingCards)
          ..where((c) => c.status.equalsValue(CallingCardStatus.complete))
          ..orderBy([(c) => OrderingTerm.desc(c.completedAt)]))
        .get();
  }

  Future<List<CallingCard>> getAbandonedCards() async {
    return await (_db.select(_db.callingCards)
          ..where((c) => c.status.equalsValue(CallingCardStatus.abandoned))
          ..orderBy([(c) => OrderingTerm.desc(c.abandonedAt)]))
        .get();
  }

  Future<CallingCard?> getCardById(int id) async {
    return await (_db.select(
      _db.callingCards,
    )..where((c) => c.id.equals(id))).getSingleOrNull();
  }

  Future<int> createCard(
    String title,
    String description,
    DateTime deadline,
  ) async {
    return await _db
        .into(_db.callingCards)
        .insert(
          CallingCardsCompanion.insert(
            title: title,
            description: description,
            deadline: deadline,
            status: CallingCardStatus.active,
          ),
        );
  }

  Future<void> completeCard(int id, String? reflection) async {
    await (_db.update(_db.callingCards)..where((c) => c.id.equals(id))).write(
      CallingCardsCompanion(
        status: const Value(CallingCardStatus.complete),
        completedAt: Value(DateTime.now()),
        reflectionNotes: Value(reflection),
      ),
    );
  }

  Future<void> abandonCard(int id, String? reason) async {
    await (_db.update(_db.callingCards)..where((c) => c.id.equals(id))).write(
      CallingCardsCompanion(
        status: const Value(CallingCardStatus.abandoned),
        abandonedAt: Value(DateTime.now()),
        abandonmentReason: Value(reason),
      ),
    );
  }

  Future<void> retryCard(int id, DateTime newDeadline) async {
    await (_db.update(_db.callingCards)..where((c) => c.id.equals(id))).write(
      CallingCardsCompanion(
        status: const Value(CallingCardStatus.retry),
        deadline: Value(newDeadline),
        abandonedAt: const Value(null),
        abandonmentReason: const Value(null),
      ),
    );
  }

  // Objectives
  Future<List<CallingCardObjective>> getObjectivesForCard(int cardId) async {
    return await (_db.select(_db.callingCardObjectives)
          ..where((o) => o.callingCardId.equals(cardId))
          ..orderBy([(o) => OrderingTerm.asc(o.sortOrder)]))
        .get();
  }

  Stream<List<CallingCardObjective>> watchObjectivesForCard(int cardId) {
    return (_db.select(_db.callingCardObjectives)
          ..where((o) => o.callingCardId.equals(cardId))
          ..orderBy([(o) => OrderingTerm.asc(o.sortOrder)]))
        .watch();
  }

  Future<int> addObjective(int cardId, String description) async {
    final existingObjectives = await getObjectivesForCard(cardId);
    final maxSortOrder = existingObjectives.isEmpty
        ? 0
        : existingObjectives.last.sortOrder;

    return await _db
        .into(_db.callingCardObjectives)
        .insert(
          CallingCardObjectivesCompanion.insert(
            callingCardId: cardId,
            description: description,
            sortOrder: maxSortOrder + 1,
          ),
        );
  }

  Future<void> toggleObjective(int objectiveId) async {
    final objective = await (_db.select(
      _db.callingCardObjectives,
    )..where((o) => o.id.equals(objectiveId))).getSingleOrNull();

    if (objective != null) {
      await (_db.update(
        _db.callingCardObjectives,
      )..where((o) => o.id.equals(objectiveId))).write(
        CallingCardObjectivesCompanion(
          isCompleted: Value(!objective.isCompleted),
          completedAt: Value(objective.isCompleted ? null : DateTime.now()),
        ),
      );
    }
  }

  Future<void> deleteObjective(int objectiveId) async {
    await (_db.delete(
      _db.callingCardObjectives,
    )..where((o) => o.id.equals(objectiveId))).go();
  }

  // Insights
  Future<List<CallingCard>> getOverdueCards() async {
    final now = DateTime.now();
    return await (_db.select(_db.callingCards)
          ..where((c) => c.status.equalsValue(CallingCardStatus.active))
          ..where((c) => c.deadline.isSmallerThanValue(now))
          ..orderBy([(c) => OrderingTerm.asc(c.deadline)]))
        .get();
  }

  Future<List<CallingCard>> getUpcomingDeadlines(int daysAhead) async {
    final now = DateTime.now();
    final future = now.add(Duration(days: daysAhead));

    return await (_db.select(_db.callingCards)
          ..where((c) => c.status.equalsValue(CallingCardStatus.active))
          ..where((c) => c.deadline.isBiggerOrEqualValue(now))
          ..where((c) => c.deadline.isSmallerThanValue(future))
          ..orderBy([(c) => OrderingTerm.asc(c.deadline)]))
        .get();
  }

  Future<Map<String, int>> getCompletionStats() async {
    final allCards = await (_db.select(_db.callingCards)).get();

    final stats = <String, int>{
      'total': allCards.length,
      'active': 0,
      'completed': 0,
      'abandoned': 0,
      'retry': 0,
    };

    for (final card in allCards) {
      switch (card.status) {
        case CallingCardStatus.active:
          stats['active'] = stats['active']! + 1;
          break;
        case CallingCardStatus.complete:
          stats['completed'] = stats['completed']! + 1;
          break;
        case CallingCardStatus.abandoned:
          stats['abandoned'] = stats['abandoned']! + 1;
          break;
        case CallingCardStatus.retry:
          stats['retry'] = stats['retry']! + 1;
          break;
      }
    }

    return stats;
  }

  Future<double> getTotalHoursInvested() async {
    final cards = await (_db.select(_db.callingCards)).get();

    int totalMinutes = 0;
    for (final card in cards) {
      totalMinutes += card.totalMinutesInvested;
    }

    return totalMinutes / 60.0;
  }

  Future<Map<int, int>> getCardMinutesForDateRange(
    DateTime start,
    DateTime end,
  ) async {
    final blocks =
        await (_db.select(_db.timeBlocks)
              ..where((t) => t.startTime.isBiggerOrEqualValue(start))
              ..where((t) => t.startTime.isSmallerThanValue(end))
              ..where((t) => t.callingCardId.isNotNull())
              ..where((t) => t.endTime.isNotNull()))
            .get();

    final cardMinutes = <int, int>{};

    for (final block in blocks) {
      if (block.callingCardId != null && block.endTime != null) {
        final duration = block.endTime!.difference(block.startTime).inMinutes;
        cardMinutes[block.callingCardId!] =
            (cardMinutes[block.callingCardId!] ?? 0) + duration;
      }
    }

    return cardMinutes;
  }
}
