import 'package:appstud/models/listening_track_model.dart';
import 'package:audioplayers/audioplayers.dart';

class ListeningTrackService {
  AudioPlayer player = AudioPlayer();
  ListeningTrack currentTrack = ListeningTrack.empty();

  ListeningTrackService() {
    player.setSource(UrlSource(currentTrack.url!));
    player.pause();
  }

  void setTrack(ListeningTrack track) {
    currentTrack = track;
    player.play(UrlSource(track.url!));
  }
}
