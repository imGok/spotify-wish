import 'package:appstud/features/playlist/controllers/playlists_controller.dart';

import '../core/classes/route_manager.dart';

class App extends RouteManager {
  static const String name = '';
  static const String home = '${App.name}/';

  App() {
    addRoute(App.home, (context) => const PlaylistsController());
  }
}
