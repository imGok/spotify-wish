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
    url = 'https://vgmsite.com/soundtracks/princess-mononoke-soundtrack/txsdogib/32%20Mononoke%20Hime%20%28Ending%29.mp3';
  }
}