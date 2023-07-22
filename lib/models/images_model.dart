import 'dart:convert';

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
