import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../widgets/Cards.dart';
import '../../api/saavn.dart';

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
                    title: songs[index]['name'],
                    image: songs[index]['image'][1]['url'],
                    url: songs[index]['downloadUrl'][3]['url'],
                    artist: songs[index]['artists'],
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
