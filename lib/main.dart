import 'package:flutter/material.dart';
import 'package:moozic/screens/Downloads_Screen.dart';
import 'package:moozic/screens/Settings_Screen.dart';
import 'package:moozic/widgets/bottom_player.dart';
import './screens/Search_screen.dart';
import './screens/Home_screen.dart';
import './screens/Music_Screen.dart';
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
    const DownloadsScreen(),
    const SettingsScreen(),
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
        '/search': (context) => const SearchScreen(),
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
                tabActiveBorder: Border.all(color: Colors.green, width: 2),
                tabBorder: Border.all(color: Colors.green, width: 1),
                tabBackgroundColor: Colors.green.withOpacity(0.1),
                tabMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                tabShadow: [
                  BoxShadow(
                      color: Colors.green.withOpacity(0.1), blurRadius: 10)
                ],
                gap: 10,
                onTabChange: ontapindex,
                tabs: [
                  GButton(
                    icon: Icons.home,
                    iconActiveColor: Colors.green,
                    text: 'Home',
                    iconColor: Colors.green,
                    textColor: Colors.green,
                    iconSize: 24,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  GButton(
                    icon: Icons.download,
                    text: 'Downloads',
                    iconActiveColor: Colors.green,
                    iconColor: Colors.green,
                    textColor: Colors.green,
                    iconSize: 24,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  GButton(
                    icon: Icons.settings,
                    text: 'Settings',
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
