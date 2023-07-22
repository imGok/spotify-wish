import 'package:appstud/models/listening_track_model.dart';
import 'package:audioplayers/audioplayers.dart';

class ListeningTrackService {
  AudioPlayer player = AudioPlayer();
  List<ListeningTrack> listeningTracks = [ListeningTrack.empty()];
  int currentTrackIndex = 0;

  ListeningTrackService() {
    player.setSource(UrlSource(listeningTracks.first.url!));
    player.pause();
  }

  void resetListeningTracks() {
    listeningTracks.clear();
    currentTrackIndex = 0;
  }

  void listenOneTrack(ListeningTrack track) {
    resetListeningTracks();
    listeningTracks.add(track);
    player.play(UrlSource(listeningTracks.first.url!));
  }

  void listenPlaylist(List<ListeningTrack> tracks) {
    resetListeningTracks();
    listeningTracks.addAll(tracks);
    player.play(UrlSource(listeningTracks.first.url!));
  }

  void playNextTrack() {
    if (currentTrackIndex < listeningTracks.length - 1) {
      currentTrackIndex++;
    } else {
      currentTrackIndex = 0;
    }
    player.play(UrlSource(listeningTracks[currentTrackIndex].url!));
  }

  ListeningTrack get currentTrack => listeningTracks[currentTrackIndex];
}
