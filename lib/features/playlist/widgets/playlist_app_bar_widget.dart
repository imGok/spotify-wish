import 'package:appstud/config/app_colors.dart';
import 'package:flutter/material.dart';

class PlaylistAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const PlaylistAppBarWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.textColor,
          fontSize: 26.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
