import '../../core/classes/route_manager.dart';
import 'controllers/controllers.dart';

class AuthApp extends RouteManager {
  static const String name = 'appstud';
  static const String playlists = AuthApp.name + '/playlists';

  AuthApp() {
    addRoute(AuthApp.playlists, (context) => const PlaylistsController());
  }
}
