import 'package:flutter/material.dart';

class PlaylistAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const PlaylistAppBarWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
          )),
      backgroundColor: Colors.black,
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
