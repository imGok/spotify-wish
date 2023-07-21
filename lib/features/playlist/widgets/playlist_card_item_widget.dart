import 'package:appstud/features/app.dart';
import 'package:appstud/models/playlists_model.dart';
import 'package:flutter/material.dart';

class PlaylistCardItemWidget extends StatelessWidget {
  final Playlist playlist;

  const PlaylistCardItemWidget({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, PlaylistRoutes.playlistsDetails, arguments: playlist);
      },
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
        margin: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          image: DecorationImage(
            image: NetworkImage(playlist.images![0].url!),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
