import 'package:clean_architecture/features/features.dart';

import '../core/classes/route_manager.dart';

class App extends RouteManager {
  static const String name = '';
  static const String home = '${App.name}/';

  App() {
    addRoute(App.home, (context) => const PlaylistsController());
  }
}
