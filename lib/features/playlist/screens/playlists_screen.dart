import 'package:appstud/core/di/services_di.dart';
import 'package:appstud/features/playlist/use_cases/get_featured_playlists_interactor.dart';
import 'package:appstud/features/playlist/widgets/appstud_loading.dart';
import 'package:appstud/features/playlist/widgets/playlist_app_bar_widget.dart';
import 'package:appstud/features/playlist/widgets/playlist_card_item_widget.dart';
import 'package:appstud/models/playlists_model.dart';
import 'package:flutter/material.dart';
import 'package:appstud/config/app_colors.dart';

class PlaylistsScreen extends StatelessWidget {
  const PlaylistsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getFeaturedPlaylistsInteractor = locator<GetFeaturedPlaylistsInteractor>();
    return FutureBuilder(
      future: getFeaturedPlaylistsInteractor.execute(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final playlists = snapshot.data as FeaturedPlaylistsResponse;
          return Scaffold(
            appBar: PlaylistAppBarWidget(title: playlists.message!),
            body: Container(
              padding: const EdgeInsets.all(6.0),
              color: AppColors.backgroundColor,
              child: GridView.builder(
                itemCount: playlists.playlists!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, index) {
                  return PlaylistCardItemWidget(playlist: playlists.playlists![index]);
                },
              ),
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
    );
  }
}
