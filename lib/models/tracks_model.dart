import 'dart:convert';

import 'package:appstud/models/images_model.dart';

class TracksResponse {
  final List<TrackItemResponse>? tracksItems;

  TracksResponse({this.tracksItems});

  Map<String, dynamic> toMap() {
    return {
      'items': tracksItems?.map((x) => x.toMap()).toList(),
    };
  }

  factory TracksResponse.fromMap(Map<String, dynamic> map) {
    return TracksResponse(
      tracksItems:
          List<TrackItemResponse>.from(map['items']?.map((x) => TrackItemResponse.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory TracksResponse.fromJson(String source) => TracksResponse.fromMap(json.decode(source));
}

class TrackItemResponse {
  final TrackInformations? track;

  TrackItemResponse({this.track});

  Map<String, dynamic> toMap() {
    return {
      'track': track?.toMap(),
    };
  }

  factory TrackItemResponse.fromMap(Map<String, dynamic> map) {
    return TrackItemResponse(
      track: TrackInformations.fromMap(map['track']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TrackItemResponse.fromJson(String source) {
    return TrackItemResponse.fromMap(json.decode(source));
  }
}

class TrackInformations {
  final Album? album;
  final List<Artist>? artists;
  final List<String>? availableMarkets;
  final int? discNumber;
  final int? durationMs;
  final bool? explicit;
  final ExternalUrls? externalUrls;
  final String? href;
  final String? id;
  final bool? isLocal;
  final bool? isPlayable;
  final String? name;
  final int? popularity;
  final String? previewUrl;
  final int? trackNumber;
  final String? type;
  final String? uri;

  TrackInformations({
    this.album,
    this.artists,
    this.availableMarkets,
    this.discNumber,
    this.durationMs,
    this.explicit,
    this.externalUrls,
    this.href,
    this.id,
    this.isLocal,
    this.isPlayable,
    this.name,
    this.popularity,
    this.previewUrl,
    this.trackNumber,
    this.type,
    this.uri,
  });

  Map<String, dynamic> toMap() {
    return {
      'album': album?.toMap(),
      'artists': artists?.map((x) => x.toMap()).toList(),
      'available_markets': availableMarkets,
      'disc_number': discNumber,
      'duration_ms': durationMs,
      'explicit': explicit,
      'external_urls': externalUrls?.toMap(),
      'href': href,
      'id': id,
      'is_local': isLocal,
      'is_playable': isPlayable,
      'name': name,
      'popularity': popularity,
      'preview_url': previewUrl,
      'track_number': trackNumber,
      'type': type,
      'uri': uri,
    };
  }

  factory TrackInformations.fromMap(Map<String, dynamic> map) {
    return TrackInformations(
      album: Album.fromMap(map['album']),
      artists: List<Artist>.from(map['artists']?.map((x) => Artist.fromMap(x))),
      availableMarkets: List<String>.from(map['available_markets']?.map((x) => x)),
      discNumber: map['disc_number'],
      durationMs: map['duration_ms'],
      explicit: map['explicit'],
      externalUrls: ExternalUrls.fromMap(map['external_urls']),
      href: map['href'],
      id: map['id'],
      isLocal: map['is_local'],
      isPlayable: map['is_playable'],
      name: map['name'],
      popularity: map['popularity'],
      previewUrl: map['preview_url'],
      trackNumber: map['track_number'],
      type: map['type'],
      uri: map['uri'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TrackInformations.fromJson(String source) =>
      TrackInformations.fromMap(json.decode(source));
}

class Album {
  final String? albumType;
  final List<Artist>? artists;
  final List<String>? availableMarkets;
  final ExternalUrls? externalUrls;
  final String? href;
  final String? id;
  final List<ImagePlaylist>? images;
  final String? name;
  final String? releaseDate;
  final String? releaseDatePrecision;
  final int? totalTracks;
  final String? type;
  final String? uri;

  Album({
    this.albumType,
    this.artists,
    this.availableMarkets,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.releaseDate,
    this.releaseDatePrecision,
    this.totalTracks,
    this.type,
    this.uri,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      albumType: json['album_type'],
      artists: List<Artist>.from(json['artists']?.map((x) => Artist.fromJson(x))),
      availableMarkets: List<String>.from(json['available_markets']?.map((x) => x)),
      externalUrls: ExternalUrls.fromJson(json['external_urls']),
      href: json['href'],
      id: json['id'],
      images: List<ImagePlaylist>.from(json['images']?.map((x) => ImagePlaylist.fromJson(x))),
      name: json['name'],
      releaseDate: json['release_date'],
      releaseDatePrecision: json['release_date_precision'],
      totalTracks: json['total_tracks'],
      type: json['type'],
      uri: json['uri'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'album_type': albumType,
      'artists': artists?.map((x) => x.toMap()).toList(),
      'available_markets': availableMarkets,
      'external_urls': externalUrls?.toMap(),
      'href': href,
      'id': id,
      'images': images?.map((x) => x.toMap()).toList(),
      'name': name,
      'release_date': releaseDate,
      'release_date_precision': releaseDatePrecision,
      'total_tracks': totalTracks,
      'type': type,
      'uri': uri,
    };
  }

  String toJson() => json.encode(toMap());

  factory Album.fromMap(Map<String, dynamic> map) {
    return Album(
      albumType: map['album_type'],
      artists: List<Artist>.from(map['artists']?.map((x) => Artist.fromMap(x))),
      availableMarkets: List<String>.from(map['available_markets']?.map((x) => x)),
      externalUrls: ExternalUrls.fromMap(map['external_urls']),
      href: map['href'],
      id: map['id'],
      images: List<ImagePlaylist>.from(map['images']?.map((x) => ImagePlaylist.fromMap(x))),
      name: map['name'],
      releaseDate: map['release_date'],
      releaseDatePrecision: map['release_date_precision'],
      totalTracks: map['total_tracks'],
      type: map['type'],
      uri: map['uri'],
    );
  }
}

class Artist {
  final ExternalUrls? externalUrls;
  final String? href;
  final String? id;
  final String? name;
  final String? type;
  final String? uri;

  Artist({
    this.externalUrls,
    this.href,
    this.id,
    this.name,
    this.type,
    this.uri,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      externalUrls: ExternalUrls.fromJson(json['external_urls']),
      href: json['href'],
      id: json['id'],
      name: json['name'],
      type: json['type'],
      uri: json['uri'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'external_urls': externalUrls?.toMap(),
      'href': href,
      'id': id,
      'name': name,
      'type': type,
      'uri': uri,
    };
  }

  String toJson() => json.encode(toMap());

  factory Artist.fromMap(Map<String, dynamic> map) {
    return Artist(
      externalUrls: ExternalUrls.fromMap(map['external_urls']),
      href: map['href'],
      id: map['id'],
      name: map['name'],
      type: map['type'],
      uri: map['uri'],
    );
  }
}

class ExternalUrls {
  final String? spotify;

  ExternalUrls({
    this.spotify,
  });

  factory ExternalUrls.fromJson(Map<String, dynamic> json) {
    return ExternalUrls(
      spotify: json['spotify'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'spotify': spotify,
    };
  }

  String toJson() => json.encode(toMap());

  factory ExternalUrls.fromMap(Map<String, dynamic> map) {
    return ExternalUrls(
      spotify: map['spotify'],
    );
  }
}

class Tracks {
  String? href;
  int? total;
  Tracks({
    this.href,
    this.total,
  });

  Map<String, dynamic> toMap() {
    return {
      'href': href,
      'total': total,
    };
  }

  factory Tracks.fromMap(Map<String, dynamic> map) {
    return Tracks(
      href: map['href'],
      total: map['total'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Tracks.fromJson(String source) => Tracks.fromMap(json.decode(source));
}
