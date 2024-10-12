import 'package:flutter/material.dart';
import 'package:kurups_app/utils/dimension/dimension.dart';

class AppSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
      top: Dimensions.appBarHeight,
      left: Dimensions.defaultSpace,
      bottom: Dimensions.defaultSpace,
      right: Dimensions.defaultSpace);

  static const EdgeInsetsGeometry paddingAllLarge =
      EdgeInsets.all(Dimensions.defaultSpace);
  static const EdgeInsetsGeometry paddingAllMedium =
      EdgeInsets.all(Dimensions.md);
  static const EdgeInsetsGeometry doctorCard = EdgeInsets.symmetric(
    vertical: Dimensions.defaultSpace,
  );
  static const EdgeInsetsGeometry paddAddDoctor = EdgeInsets.fromLTRB(
      Dimensions.sm,
      Dimensions.defaultSpace,
      Dimensions.sm,
      Dimensions.defaultSpace);

  static const EdgeInsetsGeometry inputSpacing = EdgeInsets.all(Dimensions.smd);

  static const EdgeInsetsGeometry paddAddchem = EdgeInsets.fromLTRB(
      Dimensions.sm,
      Dimensions.defaultSpace,
      Dimensions.sm,
      Dimensions.defaultSpace);
}
