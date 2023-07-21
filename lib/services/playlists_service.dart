import 'dart:convert';

import 'package:appstud/core/di/services_di.dart';
import 'package:appstud/models/playlists_model.dart';
import 'package:dio/dio.dart';

import '../../config/api_endpoints.dart';
import '../../config/app_http.dart';

class PlaylistsService {
  final AppHttp _http = locator<AppHttp>();

  PlaylistsService();

  Future<FeaturedPlaylists?> getOne() async {
    Response res = await _http.get(
      ApiEndpoint.playlists,
    );
    if (res.statusCode == 200) {
      FeaturedPlaylists playlists = FeaturedPlaylists.fromJson(jsonEncode(res.data));
      return playlists;
    }
    return null;
  }
}