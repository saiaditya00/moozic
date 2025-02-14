import 'Song.dart';

class Album {
  final String title;
  final String artist;
  final String imageUrl;
  final String id;
  final List<Song> songs;
  Album(
      {required this.title,
      required this.artist,
      required this.imageUrl,
      required this.id,
      required this.songs});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      title: json['title'],
      artist: json['artist'],
      imageUrl: json['imageUrl'],
      id: json['id'],
      songs: json['songs'].map<Song>((song) => Song.fromJson(song)).toList(),
    );
  }
}
