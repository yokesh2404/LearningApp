import 'package:flutter/material.dart';
import 'package:kurups_app/entity/request/user_details/user_details.dart';
import 'package:kurups_app/utils/constants/colors.dart';
import 'package:kurups_app/utils/dimension/dimension.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key, required this.userDetails});
  final UserDetails userDetails;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
      width: Dimensions.screenWidth / 1.5,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  userDetails.name ?? "",
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 24,
                  ),
                ),
                Text(
                  userDetails.email ?? "",
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
