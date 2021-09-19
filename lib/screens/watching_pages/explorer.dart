import 'package:flutter/material.dart';

class Explorer extends StatefulWidget {
  const Explorer({Key? key}) : super(key: key);

  @override
  _ExplorerState createState() => _ExplorerState();
}

class _ExplorerState extends State<Explorer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Explorer'),
      ),
    );
  }
}
