import 'package:appstud/core/di/services_di.dart';
import 'package:appstud/features/playlist/use_cases/get_playlist_tracks_interactor.dart';
import 'package:appstud/models/playlists_model.dart';
import 'package:appstud/models/tracks_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlaylistsDetailsScreen extends StatelessWidget {
  const PlaylistsDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetPlaylistTracksInteractor getPlaylistTracksInteractor =
        locator<GetPlaylistTracksInteractor>();
    Playlist playlist = ModalRoute.of(context)!.settings.arguments as Playlist;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          toolbarHeight: 200,
          automaticallyImplyLeading: false,
          elevation: 4,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                stops: [0.5, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 10),
            child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
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
                    image: DecorationImage(
                        image: NetworkImage(playlist.images![0].url!),
                        fit: BoxFit.cover,
                        opacity: 0.9),
                  )),
              const SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(playlist.name!,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                          const SizedBox(height: 5),
                          Text(
                            AppLocalizations.of(context)!
                                .playlistBy(playlist.owner?.displayName ?? playlist.owner!.id!),
                            style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(playlist.description!,
                              style: const TextStyle(fontSize: 15, color: Colors.white)),
                          const SizedBox(height: 5),
                          Text(
                              AppLocalizations.of(context)!
                                  .followers(playlist.tracks!.total.toString()),
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[600],
                                overflow: TextOverflow.ellipsis,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ]),
          ),
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
                    return ListTile(
                        title: Text(
                          tracks[index].track!.name!,
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(tracks[index].track!.artists!.map((e) => e.name).join(', '),
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.grey)));
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.green[800],
                ),
              );
            }
          },
        ));
  }
}
