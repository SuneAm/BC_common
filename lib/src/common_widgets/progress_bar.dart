import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double width;
  final double limit;
  final double used;
  final double height;
  final double showUsed;
  final double? usedFontSize;

  const ProgressBar({
    super.key,
    required this.width,
    required this.limit,
    required this.used,
    required this.showUsed,
    this.height = 20,
    this.usedFontSize,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (used > limit) ? 1.0 : used / limit;
    final barColor = (used > limit) ? Colors.red : Colors.green;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 197, 197, 197),
        border: Border.all(),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: percentage.clamp(0.0, 1.0),
              // Ensuring the value is between 0 and 1
              child: Container(
                decoration: BoxDecoration(
                  color: barColor,
                  //borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              showUsed.toStringAsFixed(0),
              style: TextStyle(
                color: Colors.black,
                fontSize: usedFontSize ?? 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
