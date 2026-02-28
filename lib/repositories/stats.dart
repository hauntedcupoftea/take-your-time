import 'package:drift/drift.dart';
import 'package:take_your_time/data/models.dart';
import '../data/database.dart';

class StatRepository {
  final AppDatabase _db;

  StatRepository(this._db);

  // ============================================================================
  // BASIC CRUD
  // ============================================================================

  /// Get all active (non-archived) stats
  Future<List<PersonalStat>> getActiveStats() async {
    return await (_db.select(_db.personalStats)
          ..where((s) => s.isArchived.equals(false))
          ..orderBy([(s) => OrderingTerm.desc(s.totalMinutes)]))
        .get();
  }

  /// Watch active stats as a stream
  Stream<List<PersonalStat>> watchActiveStats() {
    return (_db.select(_db.personalStats)
          ..where((s) => s.isArchived.equals(false))
          ..orderBy([(s) => OrderingTerm.desc(s.totalMinutes)]))
        .watch();
  }

  /// Get all archived stats
  Future<List<PersonalStat>> getArchivedStats() async {
    return await (_db.select(_db.personalStats)
          ..where((s) => s.isArchived.equals(true))
          ..orderBy([(s) => OrderingTerm.desc(s.archivedAt)]))
        .get();
  }

  /// Get a specific stat by ID
  Future<PersonalStat?> getStatById(int id) async {
    return await (_db.select(
      _db.personalStats,
    )..where((s) => s.id.equals(id))).getSingleOrNull();
  }

  /// Create a new stat
  Future<int> createStat(String name, StatDifficulty difficulty) async {
    return await _db
        .into(_db.personalStats)
        .insert(
          PersonalStatsCompanion.insert(name: name, difficulty: difficulty),
        );
  }

  /// Archive a stat with a reason
  Future<void> archiveStat(int id, String reason) async {
    await (_db.update(_db.personalStats)..where((s) => s.id.equals(id))).write(
      PersonalStatsCompanion(
        isArchived: const Value(true),
        archivedAt: Value(DateTime.now()),
        archiveReason: Value(reason),
      ),
    );
  }

  /// Unarchive a stat
  Future<void> unarchiveStat(int id) async {
    await (_db.update(_db.personalStats)..where((s) => s.id.equals(id))).write(
      const PersonalStatsCompanion(
        isArchived: Value(false),
        archivedAt: Value(null),
        archiveReason: Value(null),
      ),
    );
  }

  // ============================================================================
  // RANK NAMES
  // ============================================================================

  /// Get custom rank name for a stat, or return default
  Future<String> getRankName(int statId, int rank) async {
    final customName =
        await (_db.select(_db.statRankNames)
              ..where((r) => r.statId.equals(statId))
              ..where((r) => r.rankNumber.equals(rank)))
            .getSingleOrNull();

    if (customName != null) {
      return customName.rankName;
    }

    // Fall back to default names
    const defaultNames = [
      'Beginner',
      'Novice',
      'Intermediate',
      'Advanced',
      'Expert',
      'Master',
    ];

    return defaultNames[rank.clamp(0, 5)];
  }

  /// Set a custom rank name for a stat
  Future<void> setRankName(int statId, int rank, String name) async {
    await _db
        .into(_db.statRankNames)
        .insertOnConflictUpdate(
          StatRankNamesCompanion.insert(
            statId: statId,
            rankNumber: rank,
            rankName: name,
          ),
        );
  }

  /// Get all custom rank names for a stat
  Future<Map<int, String>> getAllRankNamesForStat(int statId) async {
    final ranks = await (_db.select(
      _db.statRankNames,
    )..where((r) => r.statId.equals(statId))).get();

    return {for (var r in ranks) r.rankNumber: r.rankName};
  }

  // ============================================================================
  // INSIGHTS
  // ============================================================================

  /// Get stats ranked by total time invested (most to least)
  Future<List<PersonalStat>> getStatsRankedByTime() async {
    return await (_db.select(_db.personalStats)
          ..where((s) => s.isArchived.equals(false))
          ..orderBy([(s) => OrderingTerm.desc(s.totalMinutes)]))
        .get();
  }

  /// Get minutes invested per stat for a date range
  /// Returns map of statId -> minutes
  Future<Map<int, int>> getStatMinutesForDateRange(
    DateTime start,
    DateTime end,
  ) async {
    final blocks =
        await (_db.select(_db.timeBlocks)
              ..where((t) => t.startTime.isBiggerOrEqualValue(start))
              ..where((t) => t.startTime.isSmallerThanValue(end))
              ..where((t) => t.statId.isNotNull())
              ..where((t) => t.endTime.isNotNull()))
            .get();

    final statMinutes = <int, int>{};

    for (final block in blocks) {
      if (block.statId != null && block.endTime != null) {
        final duration = block.endTime!.difference(block.startTime).inMinutes;
        statMinutes[block.statId!] =
            (statMinutes[block.statId!] ?? 0) + duration;
      }
    }

    return statMinutes;
  }

  Future<List<PersonalStat>> getStatsNearRankUp() async {
    final stats = await getActiveStats();

    return stats.where((stat) {
      final progress = stat.progressToNextRank;
      return progress >= 0.9 && stat.currentRank < 6;
    }).toList();
  }

  Future<double> getTotalHoursInvested() async {
    final stats = await (_db.select(_db.personalStats)).get();

    int totalMinutes = 0;
    for (final stat in stats) {
      totalMinutes += stat.totalMinutes;
    }

    return totalMinutes / 60.0;
  }
}
