import 'package:appstud/models/playlists_model.dart';
import 'package:appstud/services/playlists_service.dart';

class GetFeaturedPlaylistsInteractor {
  final PlaylistsService service;

  GetFeaturedPlaylistsInteractor(this.service);

  Future<FeaturedPlaylists?> execute() async {
    return await service.getOne();
  }
}