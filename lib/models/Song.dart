
class Song {
  final String title;
  final String artist;
  final String album;
  final String albumArt;
  final String url;

  Song(
      {required this.title,
      required this.artist,
      required this.album,
      required this.albumArt,
      required this.url});

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      title: json['title'],
      artist: json['artist'],
      album: json['album'],
      albumArt: json['albumArt'],
      url: json['url'],
    );
  }
  Map toJson() {
    return {
      'title': title,
      'artist': artist,
      'album': album,
      'albumArt': albumArt,
      'url': url
    };
  }
}
