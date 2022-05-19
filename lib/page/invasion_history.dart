import 'package:flutter/material.dart';
import 'package:security_system/page/invasion_history.dart';
import 'package:security_system/utils/invRecord.dart';

class InvasionHistory extends StatefulWidget {
  const InvasionHistory({Key? key}) : super(key: key);

  @override
  _InvasionHistoryState createState() => _InvasionHistoryState();
}

class _InvasionHistoryState extends State<InvasionHistory> {

  List<invRecord> history = [invRecord('19/05/2022', '01:25'), invRecord('19/05/2022', '02:25')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: history.length,
        itemBuilder: (context, index){
          return Column(
            children: [
              Row(
                children:  [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        'Date:',
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(100, 8, 8, 8),
                    child: Text(
                      history[index].date,
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children:  [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Time:',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(100, 8, 8, 8),
                    child: Text(
                      history[index].time,
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }
}
