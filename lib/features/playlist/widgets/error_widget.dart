import 'package:appstud/config/app_colors.dart';
import 'package:flutter/material.dart';

class AppStudErrorWidget extends StatelessWidget {
  final String errorMessage;

  const AppStudErrorWidget({super.key, this.errorMessage = 'Something went wrong'});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.backgroundColor,
      child: Center(
        child: Text(
          errorMessage,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
