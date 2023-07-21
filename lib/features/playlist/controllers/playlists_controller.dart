import 'package:appstud/features/playlist/screens/playlists_screen.dart';
import 'package:flutter/material.dart';

class PlaylistsController extends StatelessWidget {
  const PlaylistsController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Playlists',
      color: Colors.black,
      child: const PlaylistsScreen(),
    );
  }
}
