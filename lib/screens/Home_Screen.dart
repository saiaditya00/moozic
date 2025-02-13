import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.only(right: 25),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.3),
                  blurRadius: 10,
                ),
              ],
              border: Border.all(color: Colors.green, width: 2),
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              },
              icon: FaIcon(
                FontAwesomeIcons.search,
                color: Colors.green,
                size: 27,
              ),
            ),
          ),
        ],
        title: Text('Moozic',
            style: TextStyle(
                color: Colors.green, fontFamily: 'Modak', fontSize: 35)),
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
