import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_your_time/data/database.dart';
import '../data/models.dart';
import '../providers/repositories.dart';

class StatsPage extends ConsumerWidget {
  const StatsPage({super.key});

  void _showCreateStatDialog(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    StatDifficulty selectedDifficulty = StatDifficulty.medium;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: Colors.grey.shade900,
          title: const Text(
            'CREATE STAT',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Stat name (e.g., Guitar, Coding)',
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  filled: true,
                  fillColor: Colors.black,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<StatDifficulty>(
                initialValue: selectedDifficulty,
                decoration: const InputDecoration(
                  labelText: 'Difficulty',
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.black,
                ),
                dropdownColor: Colors.black,
                style: const TextStyle(color: Colors.white),
                items: StatDifficulty.values.map((diff) {
                  return DropdownMenuItem(
                    value: diff,
                    child: Text(diff.name.toUpperCase()),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedDifficulty = value;
                    });
                  }
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'CANCEL',
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
            TextButton(
              onPressed: () async {
                if (nameController.text.isNotEmpty) {
                  await ref
                      .read(statRepositoryProvider)
                      .createStat(nameController.text, selectedDifficulty);
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                }
              },
              child: const Text(
                'CREATE',
                style: TextStyle(
                  color: Color(0xFFFF0000),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(activeStatsProvider);

    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'PERSONAL STATS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _showCreateStatDialog(context, ref),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: const BoxDecoration(color: Color(0xFFFF0000)),
                      child: const Text(
                        '+ NEW',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Stats list
            Expanded(
              child: statsAsync.when(
                data: (stats) {
                  if (stats.isEmpty) {
                    return Center(
                      child: Text(
                        'No stats yet.\nTap + NEW to create one.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 16,
                          letterSpacing: 1,
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    itemCount: stats.length,
                    itemBuilder: (context, index) {
                      final stat = stats[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          border: Border.all(
                            color: Colors.grey.shade800,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    stat.name.toUpperCase(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                ),
                                Text(
                                  'RANK ${stat.currentRank}',
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${stat.totalHours.toStringAsFixed(1)} hours invested',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Progress bar
                            ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: LinearProgressIndicator(
                                value: stat.progressToNextRank,
                                backgroundColor: Colors.grey.shade800,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Color(0xFFFFD700),
                                ),
                                minHeight: 8,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              stat.currentRank < 5
                                  ? '${stat.hoursToNextRank.toStringAsFixed(1)}h to Rank ${stat.currentRank + 1}'
                                  : 'MAX RANK',
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(color: Color(0xFFFF0000)),
                ),
                error: (error, stack) => Center(
                  child: Text(
                    'Error: $error',
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
