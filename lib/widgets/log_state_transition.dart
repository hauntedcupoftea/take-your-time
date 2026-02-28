import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_your_time/data/database.dart';
import 'package:take_your_time/providers/repositories.dart';

class TransitionModal extends ConsumerStatefulWidget {
  final DayState completedBlock;
  final DayState nextBlock;

  const TransitionModal({
    super.key,
    required this.completedBlock,
    required this.nextBlock,
  });

  @override
  ConsumerState<TransitionModal> createState() => _TransitionModalState();
}

class _TransitionModalState extends ConsumerState<TransitionModal> {
  final _activityController = TextEditingController();
  int? _selectedStatId;
  int? _selectedCardId;
  int? _commitmentMinutes;

  @override
  void dispose() {
    _activityController.dispose();
    super.dispose();
  }

  String _getBlockName(DayState state) {
    switch (state) {
      case DayState.ob1:
        return 'BLOCK 1';
      case DayState.ft1:
        return 'BREAK 1';
      case DayState.ob2:
        return 'BLOCK 2';
      case DayState.ft2:
        return 'BREAK 2';
      case DayState.rst:
        return 'REST';
    }
  }

  Future<void> _handleTransition() async {
    final repo = ref.read(timeBlockRepositoryProvider);

    await repo.transitionToNextBlock(
      activity: _activityController.text.isEmpty
          ? null
          : _activityController.text,
      statId: _selectedStatId,
      callingCardId: _selectedCardId,
      commitmentMinutes: _commitmentMinutes,
    );

    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final statsAsync = ref.watch(activeStatsProvider);
    final cardsAsync = ref.watch(activeCardsProvider);

    return Dialog(
      backgroundColor: Colors.black,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFFF0000), width: 4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'COMPLETED: ${_getBlockName(widget.completedBlock)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'NEXT: ${_getBlockName(widget.nextBlock)}',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              TextField(
                controller: _activityController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'What did you do? (optional)',
                  hintStyle: TextStyle(color: Colors.grey.shade700),
                  filled: true,
                  fillColor: Colors.grey.shade900,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade700,
                      width: 2,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFF0000), width: 2),
                  ),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 16),

              // Tag to stat
              statsAsync.when(
                data: (stats) => stats.isEmpty
                    ? const SizedBox.shrink()
                    : DropdownButtonFormField<int>(
                        initialValue: _selectedStatId,
                        decoration: InputDecoration(
                          hintText: 'Tag to stat (optional)',
                          hintStyle: TextStyle(color: Colors.grey.shade700),
                          filled: true,
                          fillColor: Colors.grey.shade900,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade700,
                              width: 2,
                            ),
                          ),
                        ),
                        dropdownColor: Colors.grey.shade900,
                        style: const TextStyle(color: Colors.white),
                        items: [
                          const DropdownMenuItem<int>(
                            value: null,
                            child: Text('None'),
                          ),
                          ...stats.map(
                            (stat) => DropdownMenuItem<int>(
                              value: stat.id,
                              child: Text(stat.name),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _selectedStatId = value;
                          });
                        },
                      ),
                loading: () => const SizedBox.shrink(),
                error: (_, _) => const SizedBox.shrink(),
              ),
              const SizedBox(height: 16),

              cardsAsync.when(
                data: (cards) => cards.isEmpty
                    ? const SizedBox.shrink()
                    : DropdownButtonFormField<int>(
                        initialValue: _selectedCardId,
                        decoration: InputDecoration(
                          hintText: 'Tag to calling card (optional)',
                          hintStyle: TextStyle(color: Colors.grey.shade700),
                          filled: true,
                          fillColor: Colors.grey.shade900,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade700,
                              width: 2,
                            ),
                          ),
                        ),
                        dropdownColor: Colors.grey.shade900,
                        style: const TextStyle(color: Colors.white),
                        items: [
                          const DropdownMenuItem<int>(
                            value: null,
                            child: Text('None'),
                          ),
                          ...cards.map(
                            (card) => DropdownMenuItem<int>(
                              value: card.id,
                              child: Text(card.title),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _selectedCardId = value;
                          });
                        },
                      ),
                loading: () => const SizedBox.shrink(),
                error: (_, _) => const SizedBox.shrink(),
              ),
              const SizedBox(height: 16),

              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Set commitment (minutes, optional)',
                  hintStyle: TextStyle(color: Colors.grey.shade700),
                  filled: true,
                  fillColor: Colors.grey.shade900,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade700,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade700,
                      width: 2,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFF0000), width: 2),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _commitmentMinutes = int.tryParse(value);
                  });
                },
              ),
              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final repo = ref.read(timeBlockRepositoryProvider);
                        await repo.transitionToNextBlock();
                        if (context.mounted) {
                          Navigator.of(context).pop();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade700,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          'SKIP',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Continue button
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: _handleTransition,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: const BoxDecoration(
                          color: Color(0xFFFF0000),
                        ),
                        child: const Text(
                          'CONTINUE →',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
