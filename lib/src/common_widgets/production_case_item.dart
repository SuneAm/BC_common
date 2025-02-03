import 'package:flutter/material.dart';
import 'package:ordrestyring_common/ordrestyring_common.dart';

class ProductionCaseItem extends StatelessWidget {
  const ProductionCaseItem(this.caseItem, {super.key});

  final Case caseItem;

  TextStyle get medNumbers => const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 49, 49, 49),
      );

  @override
  Widget build(BuildContext context) {
    final budget = caseItem.estimatedHours.estimatedProductionHour;
    final hourSpent = caseItem.hourAggregate?.productionHourSpent ?? 0;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                caseItem.caseNumber,
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 49, 49, 49),
                ),
              ),
              if (caseItem.editorCalendar != null)
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 49, 49, 49),
                    ),
                    children: [
                      TextSpan(
                        text:
                            '${caseItem.editorCalendar!.startDate.formatDateShort} - ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: caseItem.editorCalendar!.endDate.formatDateShort,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  caseItem.projectName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 4),
                Text('Projektleder: ${caseItem.responsibleUser.fullName}'),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Timer Forbrugt", style: medNumbers),
              // const SizedBox(height: 5),
              // SizedBox(
              //   width: 400,
              //   child: VerticalBarChart(
              //     estimatedTime: timer.timer.toDouble(), // Estimated time
              //     consumedTime: caseItem.economy.billableHoursCount, // Consumed time
              //     containerWidth: 250.0,
              //   ),
              // ),
              ProgressBar(
                width: 250,
                limit: budget,
                used: hourSpent,
                showUsed: hourSpent,
                height: 50,
              )
            ],
          ),
          //const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 80.0,
              ),
              Text("Budget", style: medNumbers),
              //const SizedBox(height: 6),
              Text(
                budget.toStringAsFixed(0),
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
