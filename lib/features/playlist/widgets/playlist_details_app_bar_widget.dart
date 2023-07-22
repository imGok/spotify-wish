import 'package:appstud/config/config.dart';
import 'package:appstud/core/di/di.dart';
import 'package:appstud/core/extensions/int_extension.dart';
import 'package:appstud/core/extensions/track_extension.dart';
import 'package:appstud/models/playlists_model.dart';
import 'package:appstud/models/tracks_model.dart';
import 'package:appstud/services/listening_track_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlaylistDetailsAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Playlist playlist;
  final List<TrackItemResponse>? tracks;

  const PlaylistDetailsAppBarWidget({Key? key, required this.playlist, this.tracks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.transparent],
          stops: [0.5, 1],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => listenPlaylist(tracks!),
            child: Stack(
              alignment: Alignment.center,
              children: [
                coverAlbumWidget(playlist.images![0].url!),
                Center(
                  child: Icon(
                    Icons.play_circle_fill,
                    color: AppColors.textColor,
                    size: 50,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [playlistNameWidget(context), const Spacer(), descriptionWidget(context)],
              ),
            ),
          )
        ],
      ),
    );
  }

  Column descriptionWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          playlist.description!,
          style: TextStyle(fontSize: 15, color: AppColors.textColor),
        ),
        const SizedBox(height: 5),
        // couldn't find followers count in the api response
        Text(
          AppLocalizations.of(context)!.followers(
            playlist.tracks!.total!.formatBigNumbers(),
          ),
          style: TextStyle(
            fontSize: 15,
            color: AppColors.secondaryTextColor,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Column playlistNameWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          playlist.name!,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          AppLocalizations.of(context)!
              .playlistBy(playlist.owner?.displayName ?? playlist.owner!.id!),
          style: TextStyle(fontSize: 15, color: AppColors.secondaryTextColor),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  void listenPlaylist(List<TrackItemResponse> trackItemResponses) async {
    ListeningTrackService listeningTrackService = locator<ListeningTrackService>();
    final listenableTracksList = trackItemResponses
        .map(
          (e) => e.track!.toListeningTrack(),
        )
        .where((track) => track.url != null)
        .toList();

    listeningTrackService.listenPlaylist(listenableTracksList);
  }

  Widget coverAlbumWidget(String url) {
    return Container(
      height: 150,
      width: 150,
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 2,
            spreadRadius: 2,
            color: Colors.black26,
          ),
        ],
        image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover, opacity: 0.9),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(200.0);
}
