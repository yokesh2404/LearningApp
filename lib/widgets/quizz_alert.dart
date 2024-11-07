import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kurups_app/entity/quizz/questions_response.dart';
import 'package:kurups_app/screens/quiz/bloc/quizz_bloc.dart';
import 'package:kurups_app/screens/quiz/bloc/quizz_event.dart';
import 'package:kurups_app/provider/quizz/quizz_provider.dart';
import 'package:kurups_app/utils/constants/app_images.dart';
import 'package:kurups_app/utils/constants/colors.dart';
import 'package:kurups_app/utils/dimension/dimension.dart';
import 'package:kurups_app/utils/helper/box_decorations.dart';
import 'package:kurups_app/utils/helper/route_helper.dart';
import 'package:kurups_app/widgets/button_widget.dart';

class QuizzAlert extends StatelessWidget {
  const QuizzAlert(
      {super.key,
      required this.showExit,
      required this.correctAnswer,
      required this.incorrectAnswer,
      required this.onTryAgain,
      required this.onGoHome,
      required this.onAnswerAndHints,
      required this.bloc,
      required this.provider});

  final bool showExit;
  final int correctAnswer;
  final int incorrectAnswer;
  final VoidCallback onTryAgain;
  final VoidCallback onGoHome;
  final VoidCallback onAnswerAndHints;
  final QuizzBloc bloc;
  final QuizzProvider provider;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          if (showExit) ...[
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecorations.decorationWithShadow(
                        borderColor: AppColors.white,
                        decColor: AppColors.white),
                    child: const Icon(Icons.close),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: Dimensions.height_12,
            ),
          ],
          if (correctAnswer == 5) ...[
            _buildSuccessWidget(context)
          ] else ...[
            _buildNoneOfAnswers(context)
          ]
        ],
      ),
    );
  }

  _buildSuccessWidget(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
              height: Dimensions.height_300,
              child: Image.asset(AppImages.success)),
          const SizedBox(
            height: Dimensions.height_12,
          ),
          Text(
            "Congratulations!!",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColors.primary,
                fontSize: Dimensions.getTextSize(18),
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: Dimensions.size_06,
          ),
          Text(
            "All the 5 answers are correct.",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColors.black,
                fontSize: Dimensions.getTextSize(16),
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: Dimensions.size_24,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonWidget(
                height: Dimensions.height_48,
                onClick: () {
                  onGoHome();
                },
                buttonText: "Keep learning"),
          ),
          const SizedBox(
            height: Dimensions.size_24,
          ),
          Text(
            "Now let us go through answers and hints for your better understanding and guidelines",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: Dimensions.getTextSize(14),
                color: Colors.teal,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  _buildNoneOfAnswers(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 10), () {
        context.pushReplacementNamed(RouteHelper.answereScreenName,
            extra: bloc.state.questionsResponse!
                .data); // Use GoRouter's context.go() to navigate
      });
    });
    return Center(
      child: Column(
        children: [
          Container(
              height: Dimensions.height_300,
              alignment: Alignment.center,
              child: Image.asset(AppImages.errorImage)),
          const SizedBox(
            height: Dimensions.height_12,
          ),
          // Text(
          //   "Ooops!!",
          //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          //       color: AppColors.red,
          //       fontSize: Dimensions.size_18,
          //       fontWeight: FontWeight.w600),
          // ),
          // const SizedBox(
          //   height: Dimensions.size_06,
          // ),
          if (correctAnswer == 0) ...[
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: "None of the answer is correct!. ",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.black,
                          fontSize: Dimensions.getTextSize(16),
                          fontWeight: FontWeight.w600)),
                  TextSpan(
                      text: "Revise the lesson once again.",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.black,
                          fontSize: Dimensions.getTextSize(16),
                          fontWeight: FontWeight.w600))
                ]))
          ] else ...[
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: "Only $correctAnswer ",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.black,
                          fontSize: Dimensions.getTextSize(16),
                          fontWeight: FontWeight.w600)),
                  TextSpan(
                      text: "answers are correct.Revise the lesson once again.",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.black,
                          fontSize: Dimensions.getTextSize(16),
                          fontWeight: FontWeight.w600))
                ]))
          ],
          const SizedBox(
            height: Dimensions.height_24,
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: Dimensions.height_60,
                  width: Dimensions.width_60,
                  decoration:
                      BoxDecorations.decorationWithShadow(spreadRadius: 0.8),
                  padding: const EdgeInsets.all(Dimensions.size_12),
                  alignment: Alignment.center,
                  child: Text(
                    "$correctAnswer",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.success,
                        fontSize: Dimensions.size_18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  width: Dimensions.size_24,
                ),
                Container(
                  height: Dimensions.height_60,
                  width: Dimensions.width_60,
                  decoration:
                      BoxDecorations.decorationWithShadow(spreadRadius: 0.8),
                  padding: const EdgeInsets.all(Dimensions.size_12),
                  alignment: Alignment.center,
                  child: Text("$incorrectAnswer",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.red,
                          fontSize: Dimensions.size_18,
                          fontWeight: FontWeight.w600)),
                )
              ],
            ),
          ),
          const SizedBox(
            height: Dimensions.height_24,
          ),
          Padding(
            padding: const EdgeInsets.all(Dimensions.size_30),
            child: Column(
              children: [
                ButtonWidget(
                    textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.white,
                        fontSize: Dimensions.getTextSize(14),
                        fontWeight: FontWeight.w600),
                    onClick: () {
                      bloc.add(TryAgainClick(
                          provider: provider,
                          context: context,
                          response: QuestionsResponse()));
                    },
                    backgroundColor: AppColors.primary,
                    buttonText: "Try again"),
                const SizedBox(
                  height: Dimensions.height_24,
                ),
                Text(
                  "Now let us go through answers and hints for your better understanding and guidelines",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: Dimensions.getTextSize(14),
                      color: Colors.teal,
                      fontWeight: FontWeight.w600),
                )
                // ButtonWidget(
                //     height: Dimensions.height_40,
                //     onClick: () {
                //       onAnswerAndHints();
                //     },
                //     borderColor: AppColors.accent,
                //     backgroundColor: AppColors.warning,
                //     buttonText: "Answere & Hints"),
                // const SizedBox(
                //   height: Dimensions.height_24,
                // ),
                // ButtonWidget(
                //     backgroundColor: AppColors.warning,
                //     height: Dimensions.height_40,
                //     borderColor: AppColors.accent,
                //     fontColor: AppColors.white,
                //     onClick: () {
                //       onGoHome();
                //     },
                //     buttonText: "Go Home")
              ],
            ),
          )
        ],
      ),
    );
  }
}
