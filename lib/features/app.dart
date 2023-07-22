import 'package:appstud/core/classes/route_manager.dart';
import 'package:appstud/features/playlist/controllers/playlists_controller.dart';
import 'package:appstud/features/playlist/controllers/playlists_details_controller.dart';


class PlaylistRoutes extends RouteManager {
  static const String name = '';
  static const String playlists = '${PlaylistRoutes.name}/playlists';
  static const String playlistsDetails = '$playlists/details';

  PlaylistRoutes() {
    addRoute(PlaylistRoutes.playlists, (context) => const PlaylistsController());
    addRoute(PlaylistRoutes.playlistsDetails, (context) => const PlaylistsDetailsController());
  }
}
