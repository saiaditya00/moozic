import 'Song.dart';

class Playlist {
  final String title;
  final String imageUrl;
  final String id;
  final List<Song> songs;
  Playlist(
      {required this.title,
      required this.imageUrl,
      required this.id,
      required this.songs});

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      title: json['title'],
      imageUrl: json['imageUrl'],
      id: json['id'],
      songs: json['songs'].map<Song>((song) => Song.fromJson(song)).toList(),
    );
  }
}
