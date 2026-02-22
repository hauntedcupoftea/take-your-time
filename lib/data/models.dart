import 'package:take_your_time/data/database.dart';

const Map<StatDifficulty, List<int>> _rankThresholdsHours = {
  StatDifficulty.easy: [0, 10, 30, 70, 150, 310], // 1/2 effort
  StatDifficulty.medium: [0, 20, 60, 140, 300, 620], // Normal
  StatDifficulty.hard: [0, 40, 120, 280, 600, 1240], // 2x effort
  StatDifficulty.expert: [0, 80, 240, 560, 1200, 2480], // 4x effort
};

const List<String> _defaultRankNames = [
  'Beginner',
  'Novice',
  'Intermediate',
  'Advanced',
  'Expert',
  'Master',
];

extension PersonalStatExtensions on PersonalStat {
  /// Current rank (0-5)
  int get currentRank {
    final hours = totalMinutes / 60;
    final thresholds = _rankThresholdsHours[difficulty]!;

    for (int i = thresholds.length - 1; i >= 0; i--) {
      if (hours >= thresholds[i]) {
        return i;
      }
    }
    return 0;
  }

  double get totalHours => totalMinutes / 60;

  double get hoursToNextRank {
    if (currentRank >= 5) return 0;

    final thresholds = _rankThresholdsHours[difficulty]!;
    final nextThreshold = thresholds[currentRank + 1];
    return nextThreshold - totalHours;
  }

  double get progressToNextRank {
    if (currentRank >= 5) return 1.0;

    final thresholds = _rankThresholdsHours[difficulty]!;
    final currentThreshold = thresholds[currentRank];
    final nextThreshold = thresholds[currentRank + 1];
    final rangeSize = nextThreshold - currentThreshold;

    return ((totalHours - currentThreshold) / rangeSize).clamp(0.0, 1.0);
  }

  String getDefaultRankName() {
    return _defaultRankNames[currentRank];
  }
}

extension CallingCardExtensions on CallingCard {
  double get totalHoursInvested => totalMinutesInvested / 60;

  int get daysUntilDeadline {
    return deadline.difference(DateTime.now()).inDays;
  }

  bool get isOverdue {
    return status == CallingCardStatus.active &&
        DateTime.now().isAfter(deadline);
  }
}
