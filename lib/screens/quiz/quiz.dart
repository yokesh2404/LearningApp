import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kurups_app/injector/injector.dart';
import 'package:kurups_app/screens/chapters/chapters.dart';
import 'package:kurups_app/screens/quiz/bloc/quizz_bloc.dart';
import 'package:kurups_app/screens/quiz/provider/quizz_provider.dart';
import 'package:kurups_app/utils/constants/app_string.dart';
import 'package:kurups_app/utils/constants/colors.dart';
import 'package:kurups_app/utils/dimension/dimension.dart';
import 'package:kurups_app/utils/helper/box_decorations.dart';
import 'package:kurups_app/widgets/appbar_widget.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final Stopwatch _stopwatch = Stopwatch(); // For tracking time taken
  Timer? _timer;
  Duration _remainingTime =
      const Duration(minutes: 1); // Countdown timer (1 minute)
  String _elapsedTime = '00:00'; // Time taken
  bool _answered = false; // Check if an answer is selected
  final List<int?> _selectedAnswers =
      List.filled(1, null); // Track selected answer

  // Sample question and options
  final String question = "What is the capital of France?";
  final List<String> options = ["Paris", "London", "Rome", "Berlin"];
  final int correctAnswerIndex = 0; // Correct answer index

  QuizzProvider provider = QuizzProvider();
  @override
  void initState() {
    super.initState();
    _startTimer(); // Start timers when the page loads
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  // Function to start stopwatch and countdown timer
  void _startTimer() {
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedTime = _formatTime(_stopwatch.elapsed); // Update elapsed time
        if (_remainingTime.inSeconds > 0) {
          _remainingTime -=
              const Duration(seconds: 1); // Decrease remaining time
        } else {
          _timer?.cancel(); // Stop the timer when time runs out
          _submitQuiz(); // Submit the quiz automatically
        }
      });
    });
  }

  // Format time as mm:ss
  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  // Select an answer
  void _selectAnswer(int index) {
    setState(() {
      _selectedAnswers[0] = index;
      _answered = true;
    });
  }

  // Submit the quiz (called when time runs out or user submits)
  void _submitQuiz() {
    _stopwatch.stop(); // Stop the stopwatch
    _timer?.cancel(); // Cancel the countdown timer

    // Display result in a dialog
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Quiz Completed!'),
        content: Text(
          'Time Left: $_elapsedTime\nRemaining Time: ${_formatTime(_remainingTime)}',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return Injector.instance<QuizzBloc>();
      },
      child: BlocConsumer<QuizzBloc, QuizzState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppbarWithTotalfare(
                onBackAction: () {}, appbarTitle: AppString.selfAssesment),
            body: _buildBody(),
          );
        },
        listener: (context, state) {},
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<QuizzBloc, QuizzState>(
      builder: (context, state) {
        // return state.status.when(initial: () {
        //   return SizedBox();
        // }, loading: () {
        //   return SizedBox();
        // }, loadFailed: () {
        //   return SizedBox();
        // }, loadSuccess: () {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('To be answered in 5 Minutes',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondary),
                  textAlign: TextAlign.center),
              const Text(
                  'After working out in seperate sheet of paper,Point out the answer from the 4 options by clicking your answer.',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center),
              const SizedBox(height: 10),
              // Row for timers in separate boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left Timer: Time Taken
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Time Used: $_elapsedTime',
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary),
                    ),
                  ),
                  // Right Timer: Remaining Time
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Remaining Time: ${_formatTime(_remainingTime)}',
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ListenableBuilder(
                builder: (context, child) {
                  return _buildQuestionsWidget();
                },
                listenable: provider,
              )
              // Question
//               Text(
//                 question,
//                 style:
//                     const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 20),
//               // Row containing 4 options
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: List.generate(options.length, (index) {
//                   String option = options[index];
//                   String alphabet = String.fromCharCode(65 + index);
//                   // A, B, C, D, etc.

//                   // Determine button color based on answer status
//                   if (_answered) {
//                     if (_selectedAnswers[0] == index) {
// // Wrong answer turns red
//                     } else {
// // Unselected answers stay grey
//                     }
//                   } else {
// // Default color for unselected answers
//                   }

//                   return Column(
//                     children: [
//                       Text(
//                         alphabet, // Display alphabet above the option
//                         style: const TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       ElevatedButton(
//                         onPressed: _answered
//                             ? null
//                             : () =>
//                                 _selectAnswer(index), // Disable after answer
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor:
//                               (int index) {}(index), // Set button color
//                           fixedSize: const Size(200, 50), // Set button size
//                         ),
//                         child: Text(
//                           option,
//                           style: const TextStyle(
//                               color: AppColors.onSecondary, fontSize: 16),
//                         ),
//                       ),
//                     ],
//                   );
//                 }),
//               ),
//               const SizedBox(
//                 height: 20,
//                 width: 30,
//               ),
//               // Submit button (only shows when an answer is selected)
//               if (_answered)
//                 ElevatedButton(
//                   onPressed: _submitQuiz,
//                   child: const Text('Submit'),
//                 )
//               else
//                 Container(), // Hide submit button until answered
            ],
          ),
        );
        // }
        // );
      },
    );
  }

  Widget _buildQuestionsWidget() {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(Dimensions.size_10),
            decoration: BoxDecorations.decorationWithShadow(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(
                        text: '${index + 1}.',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: Dimensions.size_16,
                            fontWeight: FontWeight.w600),
                        children: [TextSpan(text: "quesion ${index + 1}")])),
                const SizedBox(
                  height: Dimensions.size_10,
                ),
                _buildAnsweres(index)
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: Dimensions.height_12,
          );
        },
        itemCount: 5);
  }

  _buildAnsweres(int questionIndex) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              provider.updatuserAns(
                  quesionIndex: questionIndex, ansIndex: index);
            },
            child: Container(
              padding: const EdgeInsets.all(Dimensions.size_10),
              decoration: BoxDecorations.decorationWithShadow(),
              child: ListTile(
                leading: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecorations.decorationwithShape(
                      backgroundColor: provider.isCorrectAns(questionIndex) &&
                              index == provider.ansIndex(questionIndex)
                          ? AppColors.green
                          : AppColors.borderPrimary.withOpacity(0.2),
                      borderColor: provider.isCorrectAns(questionIndex)
                          ? AppColors.green
                          : AppColors.borderPrimary),
                ),
                title: RichText(
                    text: TextSpan(
                        text: '${index + 1}.',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: Dimensions.size_14,
                            fontWeight: FontWeight.w400),
                        children: [TextSpan(text: "ans ${index + 1}")])),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: Dimensions.size_08,
          );
        },
        itemCount: 4);
  }
}

//Determine button color based on answer status
// Color buttonColor;
// if (_answered) {
//   if (_selectedAnswers[0] == index) {
//     buttonColor = index == correctAnswerIndex
//         ? Colors.green // Correct answer turns green
//         : Colors.red; // Wrong answer turns red
//   } else {
//     buttonColor = Colors.grey; // Unselected answers stay grey
//   }
// } else {
//   buttonColor =
//       Colors.teal; // Default color for unselected answers
// }
