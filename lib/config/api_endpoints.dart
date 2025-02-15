class ApiEndpoint {
  static const baseUrl = 'https://technical-test-front.herokuapp.com';

  static const playlists = '$baseUrl/v1/browse/featured-playlists';
  static tracks(String playlistId) => '$baseUrl/v1/browse/featured-playlists/$playlistId/tracks';
}
