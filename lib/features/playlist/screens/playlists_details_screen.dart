import 'package:appstud/config/config.dart';
import 'package:appstud/core/di/services_di.dart';
import 'package:appstud/features/playlist/use_cases/get_playlist_tracks_interactor.dart';
import 'package:appstud/features/playlist/widgets/appstud_loading.dart';
import 'package:appstud/features/playlist/widgets/playlist_details_app_bar_widget.dart';
import 'package:appstud/features/playlist/widgets/track_list_tile_widget.dart';
import 'package:appstud/models/playlists_model.dart';
import 'package:appstud/models/tracks_model.dart';
import 'package:flutter/material.dart';

class PlaylistsDetailsScreen extends StatelessWidget {
  const PlaylistsDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetPlaylistTracksInteractor getPlaylistTracksInteractor =
        locator<GetPlaylistTracksInteractor>();
    Playlist playlist = ModalRoute.of(context)!.settings.arguments as Playlist;
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 51, 3),
          toolbarHeight: 200,
          automaticallyImplyLeading: false,
          elevation: 4,
          flexibleSpace: PlaylistDetailsAppBarWidget(playlist: playlist),
        ),
        body: FutureBuilder(
          future: getPlaylistTracksInteractor.execute(playlist),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final tracks = (snapshot.data as TracksResponse).tracksItems;

              return Container(
                padding: const EdgeInsets.all(6.0),
                child: ListView.builder(
                  itemCount: tracks!.length,
                  itemBuilder: (context, index) {
                    String? previewUrl = tracks[index].track?.previewUrl;
                    return TrackListTileWidget(track: tracks[index].track!, previewUrl: previewUrl);
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return const AppStudLoading();
            }
          },
        ));
  }
}
