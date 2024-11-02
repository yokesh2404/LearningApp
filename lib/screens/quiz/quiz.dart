import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:go_router/go_router.dart';
import 'package:kurups_app/entity/quizz/questions_response.dart';
import 'package:kurups_app/screens/quiz/bloc/quizz_bloc.dart';
import 'package:kurups_app/screens/quiz/bloc/quizz_event.dart';
import 'package:kurups_app/provider/quizz/quizz_provider.dart';
import 'package:kurups_app/utils/constants/app_config.dart';
import 'package:kurups_app/utils/constants/app_string.dart';
import 'package:kurups_app/utils/constants/colors.dart';
import 'package:kurups_app/utils/dimension/app_sizes.dart';
import 'package:kurups_app/utils/dimension/dimension.dart';
import 'package:kurups_app/utils/helper/app_toast_helper.dart';
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

  late QuizzBloc bloc;

  QuizzProvider provider = QuizzProvider();
  @override
  void initState() {
    super.initState();
    bloc = context.read<QuizzBloc>()..add(GetQuestions(path: widget.path));
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
    bloc.add(StartStopTimer(timerStatus: true));
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_totalTime > 0) {
        setState(() {
          _totalTime--;
          usedTime++;
        });
      } else {
        bloc.add(StartStopTimer(timerStatus: false));
        // if (usedTime != 0) {
        _submitQuiz();
        // }
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

    bloc.add(ClickToSubmit(
        provider: provider,
        context: context,
        response: bloc.state.questionsResponse!));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuizzBloc, QuizzState>(
      child: Scaffold(
        appBar: AppbarWithTotalfare(
            onBackAction: () {
              context.pop();
            },
            appbarTitle: AppString.selfAssesment),
        body: _buildBody(),
      ),
      listener: (context, state) {
        if (state.startTimer) {
          var isActive = _timer?.isActive ?? false;
          if (!isActive) {
            _startTimer();
          }
        }
      },
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
                            return _buildQuestionsWidget(state);
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
                        backgroundColor: AppColors.primary,
                        borderColor: AppColors.primary,
                        height: Dimensions.height_48,
                        onClick: () {
                          provider.getInCorrectAnswers(
                              state.questionsResponse!.data!);
                          // _submitQuiz();
                          // print(state.questionsResponse);
                          if (provider.selectedAns.length ==
                              state.questionsResponse!.data!.length) {
                            _submitQuiz();
                          } else {
                            showToast(message: AppString.selectAnswere);
                          }
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

  Widget _buildQuestionsWidget(QuizzState state) {
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
                _buildQuestions(_data),
                const SizedBox(
                  height: Dimensions.size_16,
                ),
                _buildAnsweres(index, state)
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
  }

  _buildAnsweres(int questionIndex, QuizzState state) {
    var _data = state.questionsResponse!.data![questionIndex].answers;
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _renderAnswers(questionIndex, _data[index].data ?? [],
              _data[index].correctAnswer ?? "", index);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: Dimensions.height_12,
          );
        },
        itemCount: _data!.length);

    // if (isGridView) {
  }

  _renderAnswers(int questionIndex, List<String> answers, String correctAnswere,
      int answereColumnIndex) {
    var isGridView = answers.any((e) {
      // print(e.length);
      return e.length > 7;
    });
    if (isGridView) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var _data = answers[index];
          return Column(
            children: [
              if (answereColumnIndex == 0) ...[
                Text(
                  AppConfig.answereOptions[index],
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: Dimensions.size_08,
                )
              ],
              InkWell(
                onTap: () {
                  provider.updatselectedAns(
                      quesionIndex: questionIndex,
                      answerColumnIndex: answereColumnIndex,
                      answersList: answers,
                      answere: _data);
                  // provider.updatuserAns(
                  //     quesionIndex: questionIndex,
                  //     ansIndex: index,
                  //     answers: answers);
                },
                child: Container(
                  padding: const EdgeInsets.all(Dimensions.size_10),
                  decoration: BoxDecorations.boxDecorationwithoutShadow(
                      radius: BorderRadius.all(Radius.circular(0)),
                      borderColor: AppColors.black,
                      backgroundColor: provider.isCorrectAns(questionIndex,
                                  index, answers, answereColumnIndex) &&
                              provider.checkAnsisCorrect(questionIndex,
                                  correctAnswere, answereColumnIndex)
                          ? AppColors.green.withOpacity(0.9)
                          : provider.isCorrectAns(questionIndex, index, answers,
                                  answereColumnIndex)
                              ? AppColors.red.withOpacity(0.9)
                              : AppColors.white),
                  alignment: Alignment.center,
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: Dimensions.size_14,
                                  fontWeight: FontWeight.w400),
                          children: [TextSpan(text: _data)])),
                ),
              ),
            ],
          );
        },
        itemCount: answers.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 15.0, // Spacing between columns
          mainAxisSpacing: 20, // Spacing between rows
          childAspectRatio: 1.4, // Width to height ratio
        ),
      );
    } else {
      return Wrap(
        spacing: _calculateSpacing(context, answers),
        children: answers.map((e) {
          var index = answers.indexOf(e);
          var _data = answers[index];
          return Column(
            children: [
              if (answereColumnIndex == 0) ...[
                Text(
                  AppConfig.answereOptions[index],
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: Dimensions.size_08,
                ),
              ],
              InkWell(
                onTap: () {
                  provider.updatselectedAns(
                      quesionIndex: questionIndex,
                      answerColumnIndex: answereColumnIndex,
                      answersList: answers,
                      answere: _data);
                  // provider.updatuserAns(
                  //     quesionIndex: questionIndex,
                  //     ansIndex: index,
                  //     answers: answers);
                },
                child: Container(
                  width: 70,
                  height: 70,
                  // padding: const EdgeInsets.all(Dimensions.size_10),
                  decoration: BoxDecorations.boxDecorationwithoutShadow(
                      radius: BorderRadius.all(Radius.circular(0)),
                      borderColor: AppColors.black,
                      backgroundColor: provider.isCorrectAns(questionIndex,
                                  index, answers, answereColumnIndex) &&
                              provider.checkAnsisCorrect(questionIndex,
                                  correctAnswere, answereColumnIndex)
                          ? AppColors.green.withOpacity(0.9)
                          : provider.isCorrectAns(questionIndex, index, answers,
                                  answereColumnIndex)
                              ? AppColors.red.withOpacity(0.9)
                              : AppColors.white),
                  alignment: Alignment.center,
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: Dimensions.size_14,
                                  fontWeight: FontWeight.w400),
                          children: [TextSpan(text: _data)])),
                ),
              ),
            ],
          );
        }).toList(),
      );
    }
  }

  // double _calculateSpacing(BuildContext context, int itemCount) {
  //   final screenWidth = MediaQuery.of(context).size.width;
  //   final itemWidth = 50.0; // Adjust based on the size of each item
  //   final totalItemWidth = itemCount * itemWidth;
  //   final remainingSpace = screenWidth - totalItemWidth;
  //   return remainingSpace /
  //       (itemCount > 1
  //           ? itemCount - 1
  //           : 1); // Distribute remaining space evenly
  // }

  double _calculateSpacing(BuildContext context, List<String> items) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate the total width of all items based on their text length
    double totalItemWidth = items.fold(
        0, (sum, item) => sum + 46 + 38); // Adding padding to each item

    // Calculate remaining space and distribute it evenly between items
    final remainingSpace = screenWidth - totalItemWidth;
    return remainingSpace / (items.length > 1 ? items.length - 1 : 1);
  }

  double _calculateTextWidth(String text) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: const TextStyle(fontSize: 16)),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    return textPainter.width;
  }

  _buildQuestions(QuestionsData data) {
    if (data.separationNeeded != null && data.separationNeeded!) {
      var _textData = extractDigitsAndSpecialChars(data.question ?? "");
      return RichText(
          textAlign: TextAlign.end,
          text: TextSpan(
              children: _textData.map((e) {
            RegExp regex = RegExp(r'[\d\W]+');
            if (regex.hasMatch(e)) {
              return WidgetSpan(
                  child: Math.tex(
                e.trim(),
                textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ));
            } else {
              return TextSpan(
                text: e + " ",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              );
            }
          }).toList()));
    } else {
      return Text(
        data.question ?? "",
        maxLines: 10,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
      );
    }
  }

  List<String> extractDigitsAndSpecialChars(String text) {
    // Regex to match digits and special characters
    RegExp regex = RegExp(r'[\d\W]+');
    List<String> parts = [];
    int lastMatchEnd = 0;

    // Finding matches and capturing the text around them
    for (final match in regex.allMatches(text)) {
      // Add any text before the current match
      if (match.start > lastMatchEnd) {
        parts.add(text.substring(lastMatchEnd, match.start));
      }
      // Add the matched special character or digit
      parts.add(match.group(0)!);
      lastMatchEnd = match.end;
    }
    // Add any remaining text after the last match
    if (lastMatchEnd < text.length) {
      parts.add(text.substring(lastMatchEnd));
    }

    return parts;
  }
}
