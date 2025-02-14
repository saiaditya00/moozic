import 'package:flutter/material.dart';

class BottomPlayer extends StatelessWidget {
  const BottomPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onDoubleTap: () => Navigator.pushNamed(context, '/music'),
      onTap: () => Navigator.pushNamed(context, '/music'),
      onVerticalDragStart: (details) => Navigator.pushNamed(context, '/music'),
      child: ListTile(
        leading: SizedBox(
          width: screenWidth * 0.09,
          child: Image.network(
            'https://c.saavncdn.com/307/Samayama-From-Hi-Nanna-Telugu-2023-20230918164922-150x150.jpg',
          ),
        ),
        title: Text('Samayam (from "HI Nanna")',
            style: TextStyle(
              fontSize: screenWidth * 0.037,
              color: Colors.green[400],
            )),
        subtitle: Text('Hesham Abdul Wahab',
            style: TextStyle(
              fontSize: screenWidth * 0.028,
              color: Colors.green[200],
            )),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.skip_previous_rounded,
                size: screenWidth * 0.08,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.play_arrow_rounded,
                size: screenWidth * 0.08,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.skip_next_rounded,
                size: screenWidth * 0.08,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
