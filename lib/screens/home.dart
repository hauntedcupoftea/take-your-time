import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/day_state_provider.dart';
import 'dart:math' as math;

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 1;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _onNavTap(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: const [CallingCardsPage(), DayStatePage(), StatsPage()],
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        border: Border(top: BorderSide(color: Color(0xFFFF0000), width: 4)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _navButton(
                icon: Icons.style,
                label: 'CARDS',
                index: 0,
                isActive: _currentPage == 0,
              ),
              _navButton(
                icon: Icons.calendar_today,
                label: 'TODAY',
                index: 1,
                isActive: _currentPage == 1,
              ),
              _navButton(
                icon: Icons.bar_chart,
                label: 'STATS',
                index: 2,
                isActive: _currentPage == 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navButton({
    required IconData icon,
    required String label,
    required int index,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: () => _onNavTap(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive
                  ? const Color(0xFFFF0000)
                  : const Color(0xFF666666),
              size: 26,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.white : const Color(0xFF666666),
                fontSize: 11,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Diagonal cut painter for neobrutalist shapes
class DiagonalCutPainter extends CustomPainter {
  final Color color;
  final Color borderColor;
  final double borderWidth;

  DiagonalCutPainter({
    required this.color,
    this.borderColor = Colors.black,
    this.borderWidth = 4,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final path = Path()
      ..moveTo(20, 0) // Start with diagonal cut top-left
      ..lineTo(size.width, 0)
      ..lineTo(size.width - 20, size.height) // Diagonal cut bottom-right
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Main state transition page with neobrutalism
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
        return const Color(0xFFFF0000); // Red for obligation
      case DayState.ft1:
      case DayState.ft2:
        return const Color(0xFFFFD700); // Gold for free time
      case DayState.rst:
        return const Color(0xFF00BFFF); // Blue for rest
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
            // Background diagonal stripes for texture
            CustomPaint(size: size, painter: DiagonalStripesPainter()),

            Column(
              children: [
                const SizedBox(height: 40),

                // Main state display with diagonal cut
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Current state card - neobrutalist style
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

                        // Progress indicator - bold blocks
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

                // Next block button - HUGE neobrutalist button
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: GestureDetector(
                    onTap: () {
                      ref.read(dayStateProvider.notifier).goToNext();
                    },
                    child: Transform.rotate(
                      angle: -0.02, // Slight tilt for attitude
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

// Diagonal stripes painter for background texture
class DiagonalStripesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 1)
      ..style = PaintingStyle.fill;

    const stripeWidth = 100.0;
    const angle = math.pi / 4; // 45 degrees

    for (
      double i = -size.height;
      i < size.width + size.height;
      i += stripeWidth * 2
    ) {
      final path = Path()
        ..moveTo(i, 0)
        ..lineTo(i + stripeWidth, 0)
        ..lineTo(i + stripeWidth + size.height, size.height)
        ..lineTo(i + size.height, size.height)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Placeholder pages
class CallingCardsPage extends StatelessWidget {
  const CallingCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Text(
          'CALLING CARDS',
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Text(
          'PERSONAL STATS',
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}
