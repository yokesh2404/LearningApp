import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kurups_app/injector/injector.dart';
import 'package:kurups_app/screens/chapters/chapters.dart';
import 'package:kurups_app/screens/quiz/bloc/quizz_bloc.dart';
import 'package:kurups_app/screens/quiz/bloc/quizz_event.dart';
import 'package:kurups_app/screens/quiz/provider/quizz_provider.dart';
import 'package:kurups_app/utils/constants/app_string.dart';
import 'package:kurups_app/utils/constants/colors.dart';
import 'package:kurups_app/utils/dimension/dimension.dart';
import 'package:kurups_app/utils/helper/box_decorations.dart';
import 'package:kurups_app/widgets/appbar_widget.dart';
import 'package:kurups_app/widgets/button_widget.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.path});

  final Map path;
  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // For tracking time taken
  Timer? _timer;

  int _totalTime = (5 * 60);
  int usedTime = 0;

  String formattedTime({bool isUsedTime = false}) {
    int minutes = isUsedTime ? usedTime ~/ 60 : _totalTime ~/ 60;
    int seconds = isUsedTime ? usedTime % 60 : _totalTime % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

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
    // _stopwatch.start();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_totalTime > 0) {
        setState(() {
          _totalTime--;
          usedTime++;
        });
      } else {
        _submitQuiz();
      }
    });
  }

  // Select an answer

  // Submit the quiz (called when time runs out or user submits)
  void _submitQuiz() {
    _timer?.cancel(); // Cancel the countdown timer
    _totalTime = (5 * 60);
    usedTime = 0;
    setState(() {});

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Quiz Completed!'),
        content: Text(
          'Time Left: ${formattedTime(isUsedTime: false)}\nRemaining Time: ${formattedTime(isUsedTime: true)}',
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
        return Injector.instance<QuizzBloc>()
          ..add(GetQuestions(path: widget.path));
      },
      child: BlocConsumer<QuizzBloc, QuizzState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppbarWithTotalfare(
                onBackAction: () {
                  context.pop();
                },
                appbarTitle: AppString.selfAssesment),
            body: _buildBody(),
          );
        },
        listener: (context, state) {},
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<QuizzBloc, QuizzState>(
      builder: (context, state) {
        return state.status.when(
          initial: () {
            return const SizedBox();
          },
          loadFailed: () {
            return const SizedBox();
          },
          loadSuccess: () {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
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
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
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
                                'Time Used: ${formattedTime(isUsedTime: true)}',
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
                                'Remaining Time: ${formattedTime(isUsedTime: false)}',
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
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecorations.decorationWithShadow(
                        radius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12))),
                    padding: const EdgeInsets.all(Dimensions.size_12),
                    child: ButtonWidget(
                        backgroundColor: provider.userAns.length ==
                                state.questionsResponse!.data!.length
                            ? AppColors.primary
                            : AppColors.borderPrimary,
                        borderColor: provider.userAns.length ==
                                state.questionsResponse!.data!.length
                            ? AppColors.primary
                            : AppColors.borderPrimary,
                        height: Dimensions.height_48,
                        onClick: () {
                          if (provider.userAns.length ==
                              state.questionsResponse!.data!.length) {}
                        },
                        buttonText: AppString.submit),
                  ),
                )
              ],
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildQuestionsWidget() {
    return BlocBuilder<QuizzBloc, QuizzState>(
      builder: (context, state) {
        return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var _data = state.questionsResponse!.data![index];
              return Container(
                padding: const EdgeInsets.all(Dimensions.size_10),
                decoration: BoxDecorations.decorationWithShadow(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _data.question ?? "",
                      maxLines: 10,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    // RichText(
                    //     text: TextSpan(

                    //   text: '${_data.question}.',
                    //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    //       fontSize: Dimensions.size_16,
                    //       fontWeight: FontWeight.w600),
                    // )),
                    const SizedBox(
                      height: Dimensions.size_16,
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
            itemCount: state.questionsResponse!.data!.length);
      },
    );
  }

  _buildAnsweres(int questionIndex) {
    return BlocBuilder<QuizzBloc, QuizzState>(
      builder: (context, state) {
        return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var _data =
                  state.questionsResponse!.data![questionIndex].answers![index];
              return InkWell(
                onTap: () {
                  provider.updatuserAns(
                      quesionIndex: questionIndex,
                      ansIndex: index,
                      answers: state
                          .questionsResponse!.data![questionIndex].answers!);
                },
                child: Container(
                  padding: const EdgeInsets.all(Dimensions.size_10),
                  decoration: BoxDecorations.decorationWithShadow(
                      decColor: provider.isCorrectAns(
                                  questionIndex,
                                  index,
                                  state.questionsResponse!.data![questionIndex]
                                      .answers!) &&
                              provider.checkAnsisCorrect(
                                  questionIndex,
                                  state.questionsResponse!.data![questionIndex]
                                          .correctAnswere ??
                                      "")
                          ? AppColors.green.withOpacity(0.9)
                          : provider.isCorrectAns(
                                  questionIndex,
                                  index,
                                  state.questionsResponse!.data![questionIndex]
                                      .answers!)
                              ? AppColors.red.withOpacity(0.9)
                              : AppColors.white),
                  child: ListTile(
                    leading: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecorations.decorationwithShape(
                          borderColor: provider.isCorrectAns(
                                  questionIndex,
                                  index,
                                  state.questionsResponse!.data![questionIndex]
                                      .answers!)
                              ? AppColors.primary
                              : AppColors.borderPrimary),
                      alignment: Alignment.center,
                      child: Container(
                        height: 16,
                        width: 16,
                        decoration: BoxDecorations.decorationwithShape(
                          backgroundColor: provider.isCorrectAns(
                                  questionIndex,
                                  index,
                                  state.questionsResponse!.data![questionIndex]
                                      .answers!)
                              ? AppColors.primary
                              : AppColors.borderPrimary.withOpacity(0.2),
                        ),
                      ),
                    ),
                    title: RichText(
                        text: TextSpan(
                            text: '',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: Dimensions.size_14,
                                    fontWeight: FontWeight.w400),
                            children: [TextSpan(text: _data)])),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: Dimensions.size_08,
              );
            },
            itemCount:
                state.questionsResponse!.data![questionIndex].answers!.length);
      },
    );
  }
}
