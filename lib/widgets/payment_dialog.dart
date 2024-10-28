import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kurups_app/entity/lessons/lessons_response.dart';
import 'package:kurups_app/entity/payment/payment_details_response.dart';
import 'package:kurups_app/screens/lessons/bloc/lessons_bloc.dart';
import 'package:kurups_app/utils/constants/app_images.dart';
import 'package:kurups_app/utils/constants/colors.dart';
import 'package:kurups_app/utils/dimension/dimension.dart';
import 'package:kurups_app/utils/helper/box_decorations.dart';
import 'package:kurups_app/widgets/button_widget.dart';

class PaymentDialog extends StatelessWidget {
  const PaymentDialog(
      {super.key,
      required this.paymentDetails,
      required this.bloc,
      required this.path,
      required this.lessonsData});
  final LessonsBloc bloc;
  final PaymentDetails paymentDetails;
  final Map path;
  final LessonsData lessonsData;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appBarColorEnd,
        body: SingleChildScrollView(
          child: Column(
            children: [
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
                          decColor: AppColors.white.withOpacity(0.5)),
                      child: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: Dimensions.height_12,
              ),
              Text(
                "Get your lessons !!",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: Dimensions.size_20),
              ),
              const SizedBox(
                height: Dimensions.height_24,
              ),
              Image.asset(AppImages.paymentBackground),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Dimensions.size_24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      paymentDetails.courseName ?? "Course name",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: Dimensions.size_20),
                    ),
                    const SizedBox(
                      height: Dimensions.size_06,
                    ),
                    Text(
                      "Elevate Your Skills: Purchase, Learn, and Conquer Maths with Kurup App!",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: Dimensions.size_12),
                    ),
                    const SizedBox(
                      height: Dimensions.size_06,
                    ),
                    Text(
                      "Language: ${paymentDetails.language ?? ""}",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: Dimensions.size_12),
                    ),
                    const SizedBox(
                      height: Dimensions.size_12,
                    ),
                    Text(
                      "${paymentDetails.currencySymbol ?? ""} ${paymentDetails.amount ?? ""}",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: Dimensions.size_24),
                    ),
                    const SizedBox(
                      height: Dimensions.size_12,
                    ),
                    ButtonWidget(
                        borderColor: AppColors.warning,
                        backgroundColor: AppColors.warning,
                        onClick: () {
                          context.pop();
                          bloc.add(PaymentClick(
                              databasePath: path,
                              data: lessonsData,
                              context: context,
                              paymentDetails: paymentDetails));
                        },
                        buttonText: "Buy now")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
