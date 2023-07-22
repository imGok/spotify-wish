import 'package:appstud/models/playlists_model.dart';
import 'package:appstud/services/playlists_service.dart';
import 'package:flutter/material.dart';

class GetFeaturedPlaylistsInteractor {
  final PlaylistsService service;

  GetFeaturedPlaylistsInteractor(this.service);

  Future<FeaturedPlaylistsResponse?> execute() async {
    try {
      return await service.getOnePlaylist();
    } on Exception catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
