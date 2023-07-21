import '../core/classes/route_manager.dart';
import '../features/app.dart';

class Routes extends RouteManager {
  Routes() {
    addAll(App().routes);
  }
}
