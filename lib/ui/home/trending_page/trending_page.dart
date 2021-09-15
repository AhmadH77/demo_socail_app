import 'package:flutter/material.dart';

class TrendingPage extends StatefulWidget {
  final set_state;

  const TrendingPage({Key? key, required this.set_state}) : super(key: key);

  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(color: Colors.white));
  }
}
