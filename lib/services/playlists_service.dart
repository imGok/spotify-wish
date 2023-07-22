import 'dart:convert';

import 'package:appstud/config/api_endpoints.dart';
import 'package:appstud/config/app_http.dart';
import 'package:appstud/core/di/di.dart';
import 'package:appstud/models/playlists_model.dart';
import 'package:appstud/models/tracks_model.dart';
import 'package:dio/dio.dart';

class PlaylistsService {
  final AppHttp _http = locator<AppHttp>();

  PlaylistsService();

  Future<FeaturedPlaylistsResponse?> getOnePlaylist() async {
    Response res = await _http.get(
      ApiEndpoint.playlists,
    );
    if (res.statusCode == 200) {
      FeaturedPlaylistsResponse playlists =
          FeaturedPlaylistsResponse.fromJson(jsonEncode(res.data));
      return playlists;
    }
    return null;
  }

  Future<TracksResponse?> getTracks(Playlist playlist) async {
    Response res = await _http.get(
      playlist.tracks!.href!,
    );
    if (res.statusCode == 200) {
      TracksResponse tracks = TracksResponse.fromJson(jsonEncode(res.data));
      return tracks;
    }
    return null;
  }
}
