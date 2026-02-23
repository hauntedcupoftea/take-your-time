import 'package:flutter/material.dart';

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
