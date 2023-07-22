import 'package:appstud/features/app.dart';
import 'package:appstud/features/playlist/widgets/appstud_loading.dart';
import 'package:appstud/features/playlist/widgets/audio_player_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'config/config.dart';
import 'core/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  setupLocator();
  runApp(const AppStud());
}

class AppStud extends StatelessWidget {
  const AppStud({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppStud',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('fr'),
      ],
      initialRoute: PlaylistRoutes.playlists,
      routes: Routes().routes,
      builder: (context, child) {
        if (child == null) {
          return const AppStudLoading();
        }
        return Overlay(
          initialEntries: [
            OverlayEntry(
              builder: (context) => Scaffold(
                body: child,
                bottomNavigationBar: const AudioPlayerBottomBar(),
              ),
            ),
          ],
        );
      },
    );
  }
}
