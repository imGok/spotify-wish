import 'package:appstud/core/di/services_di.dart';
import 'package:appstud/features/playlist/use_cases/get_featured_playlists_interactor.dart';
import 'package:appstud/models/playlists_model.dart';
import 'package:flutter/material.dart';

class PlaylistsScreen extends StatelessWidget {
  const PlaylistsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getFeaturedPlaylistsInteractor = locator<GetFeaturedPlaylistsInteractor>();
    return FutureBuilder(
      future: getFeaturedPlaylistsInteractor.execute(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final playlists = snapshot.data as FeaturedPlaylists;
          return Scaffold(
            appBar: AppBar(
              title: Text(playlists.message!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                  )),
              backgroundColor: Colors.black,
            ),
            body: Container(
              padding: const EdgeInsets.all(6.0),
              color: Colors.black,
              child: GridView.builder(
                itemCount: playlists.playlists!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      image: DecorationImage(
                        image: NetworkImage(playlists.playlists![index].images![0].url!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else {
          return Center(
            child: Container(
              color: Colors.black,
              child: CircularProgressIndicator(
                color: Colors.green[800],
              ),
            ),
          );
        }
      },
    );
  }
}
