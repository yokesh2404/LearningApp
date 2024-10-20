import 'package:flutter/material.dart';

import 'package:kurups_app/utils/constants/colors.dart';

class AppbarWithTotalfare extends StatelessWidget
    implements PreferredSizeWidget {
  final double? appbarHeight;
  final VoidCallback onBackAction;

  final String appbarTitle;

  const AppbarWithTotalfare({
    super.key,
    this.appbarHeight,
    required this.onBackAction,
    required this.appbarTitle,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Back button
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        onPressed: () {
          // Handle back action
          onBackAction();
        },
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              AppColors.primary,
              AppColors.primary
            ], // Gradient colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),

      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            appbarTitle,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 20, color: AppColors.white),
          ),
        ],
      ),

      centerTitle: true, // To center the title in AppBar
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
