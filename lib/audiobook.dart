import 'package:flutter/material.dart';

class AudioBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.backspace),
        ],
      ),
      body: Text('AudioBook'),
    );
  }
}
