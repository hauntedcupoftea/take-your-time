import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_your_time/providers/day_state_provider.dart';
import 'package:take_your_time/styling/painters.dart';

class DayStatePage extends ConsumerWidget {
  const DayStatePage({super.key});

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
  Widget build(BuildContext context, WidgetRef ref) {
    final currentState = ref.watch(dayStateProvider);
    final size = MediaQuery.of(context).size;
    final stateColor = _getStateColor(currentState);

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
                                  child: const Text(
                                    '0:00',
                                    style: TextStyle(
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
                    onTap: () {
                      ref.read(dayStateProvider.notifier).goToNext();
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
