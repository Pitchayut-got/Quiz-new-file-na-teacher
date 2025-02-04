import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summary});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...summary.map((data) {
          // Add scroll View
          return Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // circle number
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade300, shape: BoxShape.circle),
                  alignment: Alignment.center,
                  child: Text(
                    '${(data['question_id'] as int) + 1 }', // bind as string
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            
                const SizedBox(
                  width: 10,
                ),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${data['question']}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text( // user select answer
                      '${data['user_answer']}',
                      style: TextStyle(
                          color: Colors.red.shade100,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                     Text(
                      '${data['correct_answer']}',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )
                  ],
                ),
                ),
                
              ],
            ),
          );
        })
      ],
    ),
    ),
    );
  }
}
