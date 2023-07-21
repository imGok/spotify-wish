import 'dart:convert';

class FeaturedPlaylistsResponse {
  String? message;
  List<Playlist>? playlists;
  FeaturedPlaylistsResponse({
    this.message,
    this.playlists,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'playlists': playlists?.map((play) => play.toMap()).toList(),
    };
  }

  factory FeaturedPlaylistsResponse.fromMap(Map<String, dynamic> map) {
    return FeaturedPlaylistsResponse(
      message: map['message'],
      playlists: map['playlists'] != null
          ? List<Playlist>.from(map['playlists']['items']?.map((play) => Playlist.fromMap(play)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeaturedPlaylistsResponse.fromJson(String source) =>
      FeaturedPlaylistsResponse.fromMap(json.decode(source));
}

class Playlist {
  bool? collaborative;
  String? description;
  String? href;
  String? id;
  List<ImagePlaylist>? images;
  String? name;
  Owner? owner;
  String? primaryColor;
  String? snapshotId;
  Tracks? tracks;
  String? type;
  String? uri;

  Playlist({
    this.collaborative,
    this.description,
    this.href,
    this.id,
    this.images,
    this.name,
    this.owner,
    this.primaryColor,
    this.snapshotId,
    this.tracks,
    this.type,
    this.uri,
  });

  Map<String, dynamic> toMap() {
    return {
      'collaborative': collaborative,
      'description': description,
      'href': href,
      'id': id,
      'images': images?.map((x) => x.toMap()).toList(),
      'name': name,
      'owner': owner?.toMap(),
      'primaryColor': primaryColor,
      'snapshotId': snapshotId,
      'tracks': tracks?.toMap(),
      'type': type,
      'uri': uri,
    };
  }

  factory Playlist.fromMap(Map<String, dynamic> map) {
    return Playlist(
      collaborative: map['collaborative'],
      description: map['description'],
      href: map['href'],
      id: map['id'],
      images: map['images'] != null
          ? List<ImagePlaylist>.from(map['images']?.map((x) => ImagePlaylist.fromMap(x)))
          : null,
      name: map['name'],
      owner: map['owner'] != null ? Owner.fromMap(map['owner']) : null,
      primaryColor: map['primaryColor'],
      snapshotId: map['snapshotId'],
      tracks: map['tracks'] != null ? Tracks.fromMap(map['tracks']) : null,
      type: map['type'],
      uri: map['uri'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Playlist.fromJson(String source) => Playlist.fromMap(json.decode(source));
}

class ImagePlaylist {
  int? height;
  String? url;
  int? width;
  ImagePlaylist({
    this.height,
    this.url,
    this.width,
  });

  Map<String, dynamic> toMap() {
    return {
      'height': height,
      'url': url,
      'width': width,
    };
  }

  factory ImagePlaylist.fromMap(Map<String, dynamic> map) {
    return ImagePlaylist(
      height: map['height'],
      url: map['url'],
      width: map['width'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ImagePlaylist.fromJson(String source) => ImagePlaylist.fromMap(json.decode(source));
}

class Owner {
  String? displayName;
  String? href;
  String? id;
  String? type;
  String? uri;
  Owner({
    this.displayName,
    this.href,
    this.id,
    this.type,
    this.uri,
  });

  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'href': href,
      'id': id,
      'type': type,
      'uri': uri,
    };
  }

  factory Owner.fromMap(Map<String, dynamic> map) {
    return Owner(
      displayName: map['displayName'],
      href: map['href'],
      id: map['id'],
      type: map['type'],
      uri: map['uri'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Owner.fromJson(String source) => Owner.fromMap(json.decode(source));
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
