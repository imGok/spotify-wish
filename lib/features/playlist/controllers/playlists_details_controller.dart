import 'package:appstud/features/playlist/screens/playlists_details_screen.dart';
import 'package:appstud/features/playlist/screens/playlists_screen.dart';
import 'package:flutter/material.dart';

class PlaylistsDetailsController extends StatelessWidget {
  const PlaylistsDetailsController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Playlists Details',
      color: Colors.black,
      child: const PlaylistsDetailsScreen(),
    );
  }
}
