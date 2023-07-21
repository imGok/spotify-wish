import 'package:appstud/models/playlists_model.dart';
import 'package:appstud/models/tracks_model.dart';
import 'package:appstud/services/playlists_service.dart';
import 'package:flutter/material.dart';

class GetPlaylistTracksInteractor {
  final PlaylistsService service;

  GetPlaylistTracksInteractor(this.service);

  Future<TracksResponse?> execute(Playlist playlist) async {
    try {
      final response = await service.getTracks(playlist);
      return response;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
