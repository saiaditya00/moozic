import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moozic/screens/Downloads/Downloads_Screen.dart';
import 'package:moozic/screens/Settings/Settings_Screen.dart';
import 'package:moozic/widgets/bottom_player.dart';
import 'screens/Search/Search_screen.dart';
import './screens/Home/Home_screen.dart';
import 'screens/Music/Music_Screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;
  List<Widget> pages = <Widget>[
    const HomeScreen(),
    const SearchScreen(),
    const DownloadsScreen(),
  ];
  ontapindex(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/settings': (context) => const SettingsScreen(),
        '/music': (context) => const MusicScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomPlayer(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: GNav(
                tabBorder: Border(
                  top: BorderSide(color: Colors.green, width: 2),
                ),
                tabActiveBorder: Border(
                    top: BorderSide(
                  color: Colors.green,
                  width: 2,
                )),
                tabBackgroundColor: Colors.green.withOpacity(0.2),
                gap: 10,
                onTabChange: ontapindex,
                tabs: [
                  GButton(
                    icon: FontAwesomeIcons.home,
                    iconActiveColor: Colors.green,
                    text: 'Home',
                    iconColor: Colors.green,
                    textColor: Colors.green,
                    iconSize: 24,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  GButton(
                    icon: FontAwesomeIcons.search,
                    text: 'settings',
                    iconActiveColor: Colors.green,
                    iconColor: Colors.green,
                    textColor: Colors.green,
                    iconSize: 24,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  GButton(
                    icon: FontAwesomeIcons.download,
                    text: 'downloads',
                    iconActiveColor: Colors.green,
                    iconColor: Colors.green,
                    textColor: Colors.green,
                    iconSize: 24,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                ],
                selectedIndex: selectedIndex,
              ),
            ),
          ],
        ),
        body: IndexedStack(
          index: selectedIndex,
          children: pages,
        ),
      ),
    );
  }
}
