import 'package:flutter/material.dart';

class ControlHome extends StatefulWidget {
  const ControlHome({Key? key}) : super(key: key);

  @override
  _ControlHomeState createState() => _ControlHomeState();
}

class _ControlHomeState extends State<ControlHome> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Control Home'),
      ),
    );
  }
}
