import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_network/image_network.dart';
import 'package:kurups_app/entity/quizz/questions_response.dart';
import 'package:kurups_app/utils/constants/app_string.dart';
import 'package:kurups_app/utils/dimension/dimension.dart';
import 'package:kurups_app/utils/helper/route_helper.dart';
import 'package:kurups_app/widgets/appbar_widget.dart';
import 'package:kurups_app/widgets/button_widget.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: kIsWeb
                          ? ImageNetwork(
                              image: answerHints[index].imageUrl ?? "",
                              width: Dimensions.screenWidth,
                              onError: const SizedBox(
                                child: Text("can't show image"),
                              ),
                              fitWeb: BoxFitWeb.scaleDown,
                              height: Dimensions.height_200,
                            )
                          : CachedNetworkImage(
                              imageUrl: answerHints[index].imageUrl ?? "",
                              width: 100,
                              height: 100,
                              errorWidget: (context, url, error) {
                                return const SizedBox(
                                  child: Text("can't show image"),
                                );
                              },
                            )
                      // Image.network(

                      // ),
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
        ],
      ),
    );
  }
}
