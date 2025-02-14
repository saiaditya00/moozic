import 'Album.dart';
import 'Song.dart';

class Artist {
  final String name;
  final String imageUrl;
  final String id;
  final List<Album> albums;
  final List<Song> songs;

  Artist(
      {required this.name,
      required this.imageUrl,
      required this.id,
      required this.albums,
      required this.songs});

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      name: json['name'],
      imageUrl: json['imageUrl'],
      id: json['id'],
      albums:
          json['albums'].map<Album>((album) => Album.fromJson(album)).toList(),
      songs: json['songs'].map<Song>((song) => Song.fromJson(song)).toList(),
    );
  }
}
