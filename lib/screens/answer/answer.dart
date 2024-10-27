import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kurups_app/entity/quizz/questions_response.dart';
import 'package:kurups_app/utils/constants/app_string.dart';
import 'package:kurups_app/utils/dimension/dimension.dart';
import 'package:kurups_app/utils/helper/route_helper.dart';
import 'package:kurups_app/widgets/appbar_widget.dart';
import 'package:kurups_app/widgets/button_widget.dart';

class AnswerHint extends StatelessWidget {
  // List of image paths
  final List<QuestionsData> answerHints;

  const AnswerHint({super.key, required this.answerHints});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWithTotalfare(
          onBackAction: () {
            context.pop();
          },
          appbarTitle: AppString.answereHint),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: answerHints.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.network(
                      answerHints[index].imageUrl ?? "",
                      width: 100,
                      height: 100,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonWidget(
                onClick: () {
                  context.pop();
                },
                height: Dimensions.height_48,
                buttonText: AppString.goBackHome),
          )
          // ElevatedButton(
          //   onPressed: () {},
          //   style: ElevatedButton.styleFrom(
          //     foregroundColor: Colors.white,
          //     backgroundColor: const Color.fromARGB(255, 97, 147, 119),
          //     padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(30.0),
          //     ),
          //     elevation: 5,
          //   ),
          //   child: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Icon(
          //         Icons.home,
          //         size: 30.0,
          //         color:
          //             const Color.fromARGB(255, 35, 23, 62), // Customize color
          //       ),
          //       SizedBox(width: 10),
          //       Text(
          //         'My Home',
          //         style: TextStyle(color: Color.fromARGB(255, 35, 23, 62)),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
