import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Settings',
              style: TextStyle(
                  color: Colors.green, fontFamily: 'Modak', fontSize: 35)),
        ),
      ),
      body: Center(
        child: Text('Settings'),
      ),
    );
  }
}
