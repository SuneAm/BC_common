import 'package:flutter/material.dart';

class VerticalBarChart extends StatelessWidget {
  final double consumedTime; // Consumed time
  final double estimatedTime; // Estimated time
  final double containerWidth; // Fixed width of the container
  final double barHeight = 23.0;

  // Constructor for the VerticalBarChart widget
  const VerticalBarChart({
    super.key, // A named key parameter for widget identification (optional)
    required this.consumedTime, // Required consumedTime parameter
    required this.estimatedTime, // Required estimatedTime parameter
    required this.containerWidth,
  });

  @override
  Widget build(BuildContext context) {
    // Ensure that estimatedTime is not zero or negative
    final validEstimatedTime = estimatedTime <= 0 ? 1 : estimatedTime;

    // Calculate the percentage of consumed and estimated time relative to the container width
    final consumedPercentage = consumedTime / validEstimatedTime;

    // Calculate the height of the consumed time bar as a percentage of the container width
    final consumedBarHeight = consumedPercentage * containerWidth;

    // Calculate the interpolated color based on the consumed percentage
    Color barColor = const Color.fromARGB(255, 70, 70, 70);

    if (consumedPercentage <= 0.8) {
      // Green color for the first 80%
      barColor = const Color.fromARGB(255, 70, 70, 70);
    } else if (consumedPercentage >= 0.8 && consumedPercentage <= 1) {
      // Red color for everything over 80%
      barColor = const Color.fromARGB(255, 126, 90, 66);
    } else if (consumedPercentage >= 1) {
      // Red color for everything over 100%
      barColor = const Color.fromARGB(255, 242, 100, 33);
    }

    // Create a solid color for the consumed time bar
    final consumedBar = Container(
      width: consumedBarHeight, // Set the width of the consumed time bar
      height: barHeight, // Set the height of the consumed time bar
      color: barColor, // Color for the consumed time bar
    );

    // Create a column with bars aligned at the bottom
    return Column(
      mainAxisAlignment: MainAxisAlignment.end, // Align bars at the bottom of the column
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Container for the estimated time bar
        Container(
          width: containerWidth, // Set the width of the estimated time bar
          height: barHeight, // Set the height of the estimated time bar
          color: const Color.fromARGB(255, 107, 142, 191), // Color for estimated time bar
        ),
        // Container for the consumed time bar with interpolated color
        consumedBar,
      ],
    );
  }
}
