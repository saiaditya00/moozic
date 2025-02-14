import 'package:flutter/material.dart';

class MusicCard extends StatelessWidget {
  final String title;
  final List<dynamic> artist;
  final String image;
  final String url;
  final dynamic duration;
  final String id;
  const MusicCard(
      {super.key, required this.title,
      required this.artist,
      required this.image,
      required this.url,
      required this.duration,
      required this.id});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      borderOnForeground: true,
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(image, fit: BoxFit.cover),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.green[200]),
        ),
        subtitle: Text(artist.map((a) => a['name']).join(', ')),
        trailing: Text(duration.toString()),
        onTap: () {
          print('Playing $title');
        },
      ),
    );
  }
}

class AlbumsCard extends StatelessWidget {
  final String title;
  final String image;
  final String id;
  const AlbumsCard({super.key, required this.title, required this.image, required this.id});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      borderOnForeground: true,
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(image, fit: BoxFit.cover),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.green[200]),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/album', arguments: id);
        },
      ),
    );
  }
}

class ArtistsCard extends StatelessWidget {
  final String name;
  final String image;
  final String id;
  const ArtistsCard({super.key, required this.name, required this.image, required this.id});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      borderOnForeground: true,
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(image, fit: BoxFit.cover),
          ),
        ),
        title: Text(
          name,
          style: TextStyle(color: Colors.green[200]),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/artist', arguments: id);
        },
      ),
    );
  }
}

class PLaylist extends StatelessWidget {
  const PLaylist({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.playlist_play),
      title: Text('Playlist'),
      onTap: () {
        Navigator.pushNamed(context, '/playlist');
      },
    );
  }
}
