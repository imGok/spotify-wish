import 'package:appstud/models/tracks_model.dart';
import 'package:flutter/material.dart';

class TrackListTileWidget extends StatelessWidget {
  final TrackInformations track;

  const TrackListTileWidget({Key? key, required this.track}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          track.name!,
          style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(track.artists!.map((e) => e.name).join(', '),
            overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.grey)));
  }
}
