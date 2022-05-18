import 'package:flutter/material.dart';

class InvasionHistory extends StatefulWidget {
  const InvasionHistory({Key? key}) : super(key: key);

  @override
  _InvasionHistoryState createState() => _InvasionHistoryState();
}

class _InvasionHistoryState extends State<InvasionHistory> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Invasion History'),
      ),
    );
  }
}
