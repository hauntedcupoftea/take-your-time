import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_your_time/data/database.dart';
import 'package:take_your_time/providers/repositories.dart';
import 'package:take_your_time/styling/painters.dart';
import 'package:take_your_time/widgets/log_state_transition.dart';

class DayStatePage extends ConsumerStatefulWidget {
  const DayStatePage({super.key});

  @override
  ConsumerState<DayStatePage> createState() => _DayStatePageState();
}

class _DayStatePageState extends ConsumerState<DayStatePage> {
  Timer? _timer;
  Duration _elapsed = Duration.zero;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() {
          _updateElapsedTime();
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _updateElapsedTime() async {
    final currentBlock = await ref
        .read(timeBlockRepositoryProvider)
        .getCurrentBlock();
    if (currentBlock != null) {
      _elapsed = DateTime.now().difference(currentBlock.startTime);
    }
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    if (hours > 0) {
      return '$hours:${minutes.toString().padLeft(2, '0')}';
    }
    return '$minutes:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}';
  }

  String _getStateName(DayState state) {
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

  Color _getStateColor(DayState state) {
    switch (state) {
      case DayState.ob1:
      case DayState.ob2:
        return const Color(0xFFFF0000);
      case DayState.ft1:
      case DayState.ft2:
        return const Color(0xFFFFD700);
      case DayState.rst:
        return const Color(0xFF00BFFF);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentState = ref.watch(currentDayStateProvider);
    final size = MediaQuery.of(context).size;
    final stateColor = _getStateColor(currentState);

    // Update elapsed time when state changes
    ref.listen(currentDayStateProvider, (previous, next) {
      _updateElapsedTime();
    });

    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Stack(
          children: [
            CustomPaint(size: size, painter: DiagonalStripesPainter()),
            Column(
              children: [
                const SizedBox(height: 40),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomPaint(
                          painter: DiagonalCutPainter(
                            color: stateColor,
                            borderColor: Colors.white,
                            borderWidth: 6,
                          ),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              vertical: 60,
                              horizontal: 40,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  _getStateName(currentState),
                                  style: const TextStyle(
                                    fontSize: 52,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                    letterSpacing: 3,
                                    height: 1,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20),
                                // Time elapsed
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 3,
                                    ),
                                  ),
                                  child: Text(
                                    _formatDuration(_elapsed),
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 60),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            final isActive = index == currentState.index;
                            final isPast = index < currentState.index;

                            return Container(
                              width: 50,
                              height: 50,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                color: isActive
                                    ? stateColor
                                    : (isPast
                                          ? Colors.grey.shade800
                                          : Colors.transparent),
                                border: Border.all(
                                  color: isActive
                                      ? Colors.white
                                      : Colors.grey.shade700,
                                  width: isActive ? 4 : 2,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                    color: isActive
                                        ? Colors.black
                                        : (isPast
                                              ? Colors.white
                                              : Colors.grey.shade700),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: GestureDetector(
                    onTap: () async {
                      final currentBlock = await ref
                          .read(timeBlockRepositoryProvider)
                          .getCurrentBlock();
                      final currentState =
                          currentBlock?.blockType ?? DayState.ob1;
                      final nextState = currentState.next();

                      if (!context.mounted) return;

                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => TransitionModal(
                          completedBlock: currentState,
                          nextBlock: nextState,
                        ),
                      );
                    },
                    child: Transform.rotate(
                      angle: -0.02,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF0000),
                          border: Border.all(color: Colors.white, width: 6),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(8, 8),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'NEXT BLOCK →',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 3,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
