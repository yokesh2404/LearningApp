import 'package:flutter/material.dart';

import 'package:kurups_app/entity/request/user_details/user_details.dart';
import 'package:kurups_app/utils/constants/app_config.dart';
import 'package:kurups_app/utils/constants/app_string.dart';
import 'package:kurups_app/utils/constants/colors.dart';
import 'package:kurups_app/utils/dimension/dimension.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget(
      {super.key, required this.userDetails, required this.onClick});
  final UserDetails userDetails;
  final Function(int index) onClick;

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
          ),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var _data = AppConfig.drawerlistTile[index];
                return InkWell(
                  onTap: () {
                    onClick(index);
                  },
                  child: ListTile(
                    title: Text(_data.title ?? ""),
                    leading: Icon(_data.icons),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  height: Dimensions.size_12,
                );
              },
              itemCount: AppConfig.drawerlistTile.length),
        ],
      ),
    ));
  }
}
