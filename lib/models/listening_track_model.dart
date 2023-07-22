class ListeningTrack {
  String? songName;
  String? artistsName;
  String? url;

  ListeningTrack({
    required this.songName,
    required this.artistsName,
    required this.url,
  });

  ListeningTrack.empty() {
    songName = 'AppStud Music';
    artistsName = 'Julian KOUNE';
    url = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3';
  }
}