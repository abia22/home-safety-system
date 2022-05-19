import 'package:flutter/material.dart';

class ControlHome extends StatefulWidget {
  const ControlHome({Key? key}) : super(key: key);

  @override
  _ControlHomeState createState() => _ControlHomeState();
}

class _ControlHomeState extends State<ControlHome> {
  bool doors = false;
  bool blinds = false;
  bool alarm = false;
  bool secure = true;

  @override
  Widget build(BuildContext context) {

    Widget textSafe = const Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Text(
            'Safe',
            style: TextStyle(
                fontSize: 35,
                color: Colors.green
            ),
        )
    );

    Widget textDanger = const Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Text(
          'Danger',
          style: TextStyle(
              fontSize: 35,
              color: Colors.red
          ),
        ),
    );

    Widget switchRowDoors =
    Container(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Row(
        children: [
          Row(
            children: const [
              Text(
                'Doors',
                style: TextStyle(
                    fontSize: 30
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(150, 0, 0, 0),
            child: Row(
              children: [
                const Text(
                  'C',
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
                Switch(
                  value: doors,
                  onChanged: (bool state) {
                    setState(() {
                      doors = state;
                    });
                  },
                ),
                const Text(
                  'O',
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );

    Widget switchRowBlinds =
    Container(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Row(
          children: [
            Row(
              children: const [
                Text(
                  'Blinds',
                  style: TextStyle(
                      fontSize: 30
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(150, 0, 0, 0),
              child: Row(
                children: [
                  const Text(
                    'C',
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                  Switch(
                    value: blinds,
                    onChanged: (bool state) {
                      setState(() {
                        blinds = state;
                      });
                    },
                  ),
                  const Text(
                    'O',
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    );

    Widget switchRowAlarm =
    Container(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Row(
          children: [
            Row(
              children: const [
                Text(
                  'Alarm',
                  style: TextStyle(
                      fontSize: 30
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(165, 0, 0, 0),
              child: Switch(
                value: alarm,
                onChanged: (bool state) {
                  setState(() {
                    alarm = state;
                  });
                },
              ),
            ),
          ],
        )
    );

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'O - Opened\nC - Closed',
                style: TextStyle(
                    fontSize: 25
                ),
              ),
              switchRowDoors,
              switchRowBlinds,
              switchRowAlarm,
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Text(
                  'Current State',
                  style: TextStyle(
                    fontSize: 35
                  )
                ),
              ),
              secure ? textSafe : textDanger
            ],
          ),
        )
      ),
    );
  }
}
