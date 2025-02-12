import 'package:flutter/material.dart';
import 'package:moozic/components/Home.dart';
import 'package:moozic/components/Downloads.dart';
import 'package:moozic/components/Settings.dart';
import './components/miniplayer.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    DownloadScreen(),
    SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Moozic',
        theme: ThemeData(
            primarySwatch: Colors.blue, secondaryHeaderColor: Colors.blue),
        darkTheme: ThemeData.dark(),
        home: Scaffold(
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(
                height: 1,
                thickness: 1,
              ),
              Miniplayer(
                song: {
                  "name": "Samayama",
                  "artist":
                      "Hesham Abdul Wahab , Sithara Krishnakumar, Anurag Kulkarni",
                  "image":
                      "https://c.saavncdn.com/307/Samayama-From-Hi-Nanna-Telugu-2023-20230918164922-150x150.jpg"
                },
              ),
              NavigationBar(
                destinations: [
                  NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                  NavigationDestination(
                      icon: Icon(Icons.library_music), label: 'Downloads'),
                  NavigationDestination(
                      icon: Icon(Icons.settings), label: 'Settings'),
                ],
                selectedIndex: _selectedIndex,
                onDestinationSelected: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ],
          ),
          body: IndexedStack(
            index: _selectedIndex,
            children: _widgetOptions,
          ),
        ));
  }
}
