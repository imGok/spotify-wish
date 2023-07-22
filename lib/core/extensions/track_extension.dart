import 'package:appstud/models/listening_track_model.dart';
import 'package:appstud/models/tracks_model.dart';

extension TrackInformationsExtension on TrackInformations {
  ListeningTrack toListeningTrack() {
    return ListeningTrack(
      songName: name,
      artistsName: artists!.map((e) => e.name).join(', '),
      url: previewUrl,
    );
  }
}
