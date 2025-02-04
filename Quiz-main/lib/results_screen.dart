import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/data/quizz.dart';
import 'package:myapp/question_summary.dart';
import 'package:myapp/start_screen.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.selectedAnswers});
  

  final List<String> selectedAnswers;

  List<Map<String,Object>> getSummaryData(){

    List<Map<String,Object>> summaryData = [];

    for (int i = 0; i < selectedAnswers.length; i++){
      bool isCorrect = selectedAnswers[i] == questions[i].answers[0];
    
    summaryData.add({
      'question_id': i,
      'question': questions[i].question,
      'correct_answer': questions[i].answers[0],
      'user_answer' : selectedAnswers[i],
      'is_correct': isCorrect

      });
    }

    return summaryData;
  }
  @override
  Widget build(BuildContext context) {
    final summary = getSummaryData();
    final totalMark = summary.where((data)=> data['is_correct'] as bool).length;
    final totalQuestion = questions.length;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Results',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.deepPurple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Your Answers $totalMark out of $totalQuestion question correctly',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                QuestionsSummary(summary: getSummaryData()),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const StartScreen())); 
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    'Go Back',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
