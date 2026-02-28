import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_your_time/repositories/calling_card.dart';
import 'package:take_your_time/repositories/stats.dart';
import 'package:take_your_time/repositories/time_block.dart';

import '../data/database.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(() async {
    await database.close();
  });

  return database;
});

// Repository Providers
final timeBlockRepositoryProvider = Provider<TimeBlockRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return TimeBlockRepository(db);
});

final statRepositoryProvider = Provider<StatRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return StatRepository(db);
});

final callingCardRepositoryProvider = Provider<CallingCardRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return CallingCardRepository(db);
});

final currentBlockProvider = StreamProvider<TimeBlock?>((ref) {
  final repo = ref.watch(timeBlockRepositoryProvider);
  return repo.watchCurrentBlock();
});

final currentDayStateProvider = Provider<DayState>((ref) {
  final blockAsync = ref.watch(currentBlockProvider);
  return blockAsync.when(
    data: (block) => block?.blockType ?? DayState.ob1,
    loading: () => DayState.ob1,
    error: (_, _) => DayState.ob1,
  );
});

final activeStatsProvider = StreamProvider<List<PersonalStat>>((ref) {
  final repo = ref.watch(statRepositoryProvider);
  return repo.watchActiveStats();
});

final activeCardsProvider = StreamProvider<List<CallingCard>>((ref) {
  final repo = ref.watch(callingCardRepositoryProvider);
  return repo.watchActiveCards();
});

final cardObjectivesProvider =
    StreamProvider.family<List<CallingCardObjective>, int>((ref, cardId) {
      final repo = ref.watch(callingCardRepositoryProvider);
      return repo.watchObjectivesForCard(cardId);
    });
