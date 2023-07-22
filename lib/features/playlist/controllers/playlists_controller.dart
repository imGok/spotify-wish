import 'package:appstud/config/app_colors.dart';
import 'package:appstud/features/playlist/screens/playlists_screen.dart';
import 'package:flutter/material.dart';

class PlaylistsController extends StatelessWidget {
  const PlaylistsController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Playlists',
      color: AppColors.backgroundColor!,
      child: const PlaylistsScreen(),
    );
  }
}
