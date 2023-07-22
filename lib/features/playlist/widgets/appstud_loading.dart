import 'package:appstud/config/app_colors.dart';
import 'package:flutter/material.dart';

class AppStudLoading extends StatelessWidget {
  const AppStudLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: CircularProgressIndicator(
          color: AppColors.primary[800],
        ),
      ),
    );
  }
}
