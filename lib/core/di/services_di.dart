import 'package:appstud/config/app_config.dart';
import 'package:appstud/config/app_http.dart';
import 'package:appstud/features/playlist/use_cases/get_featured_playlists_interactor.dart';
import 'package:appstud/features/playlist/use_cases/get_playlist_tracks_interactor.dart';
import 'package:appstud/services/playlists_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.I;
void setupLocator() {
  setupServices();
  setupInteractors();
}

void setupServices() {
  locator.registerSingleton<AppHttp>(AppHttp(baseUrl: Config.host, headers: {'token': Config.token}));
  locator.registerSingleton<PlaylistsService>(PlaylistsService());
}

void setupInteractors() {
  locator.registerSingleton<GetFeaturedPlaylistsInteractor>(GetFeaturedPlaylistsInteractor(locator<PlaylistsService>()));
  locator.registerSingleton<GetPlaylistTracksInteractor>(GetPlaylistTracksInteractor(locator<PlaylistsService>()));
}
