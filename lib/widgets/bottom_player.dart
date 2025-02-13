import 'package:flutter/material.dart';

class BottomPlayer extends StatelessWidget {
  const BottomPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => Navigator.pushNamed(context, '/music'),
      onTap: () => Navigator.pushNamed(context, '/music'),
      onVerticalDragStart: (details) => Navigator.pushNamed(context, '/music'),
      child: ListTile(
        leading: SizedBox(
          width: 50,
          child: Image.network(
            'https://c.saavncdn.com/307/Samayama-From-Hi-Nanna-Telugu-2023-20230918164922-150x150.jpg',
          ),
        ),
        title: Text('Samayam (from "HI Nanna")',
            style: TextStyle(
              color: Colors.green[400],
            )),
        subtitle: const Text('Hesham Abdul Wahab'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.skip_previous_rounded),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow_rounded),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.skip_next_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
