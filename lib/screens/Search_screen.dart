import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../api/saavn.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List songs = [];
  bool isSearching = false;
  bool showicon = false;
  void searchSong(String query) {
    searchsongs(query).then((value) {
      setState(() {
        songs = value;
      });
      if (songs.isNotEmpty) {
        setState(() {
          isSearching = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Search',
                style: TextStyle(
                    color: Colors.green, fontFamily: 'Modak', fontSize: 35)),
          ),
        ),
        body: Column(
          children: [
            Container(
                margin: EdgeInsets.all(20),
                child: SearchBar(
                    controller: searchController,
                    hintText: 'Search',
                    onSubmitted: (value) {
                      if (searchController.text.isNotEmpty) {
                        searchSong(searchController.text);
                        setState(() {
                          isSearching = true;
                          });
                          FocusScope.of(context).unfocus();
                      }
                    },
                    trailing: isSearching
                        ? [CircularProgressIndicator()]
                        : searchController.text.isEmpty
                            ? [
                                IconButton(
                                  onPressed: () {
                                    if (searchController.text.isNotEmpty) {
                                      searchSong(searchController.text);
                                      setState(() {
                                        isSearching = true;
                                      });
                                    }
                                  },
                                  icon:
                                      FaIcon(FontAwesomeIcons.search, size: 20),
                                )
                              ]
                            : [
                                IconButton(
                                    onPressed: () => {
                                          setState(
                                              () => searchController.text = ''),
                                        },
                                    icon: FaIcon(FontAwesomeIcons.times))
                              ])),
            Expanded(
              child: ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  return MusicCard(
                    title: songs[index]['name']
                        .toString()
                        .replaceAll('&quot;', ''),
                    artist: songs[index]['artists']['primary'],
                    image: songs[index]['image'][0]['url'],
                    url: songs[index]['downloadUrl'][3]['url'],
                    duration: songs[index]['duration'],
                    id: songs[index]['id'],
                  );
                },
              ),
            )
          ],
        ));
  }
}

class MusicCard extends StatelessWidget {
  final String title;
  final List<dynamic> artist;
  final String image;
  final String url;
  final dynamic duration;
  final String id;
  MusicCard(
      {required this.title,
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
