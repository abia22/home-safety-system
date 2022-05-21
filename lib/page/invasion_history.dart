import 'package:flutter/material.dart';
import 'package:security_system/utils/invRecord.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InvasionHistory extends StatefulWidget {
  const InvasionHistory({Key? key}) : super(key: key);

  @override
  _InvasionHistoryState createState() => _InvasionHistoryState();
}

class _InvasionHistoryState extends State<InvasionHistory> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('invasions').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');
          return ListView.separated(
            itemCount: snapshot.data!.docs.length,
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
                          snapshot.data!.docs[index].get('date'),
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
                          snapshot.data!.docs[index].get('time'),
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
          );
        }
      ),
    );
  }
}
