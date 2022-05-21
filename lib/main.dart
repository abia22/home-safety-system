import 'package:flutter/material.dart';
import 'package:security_system/page/control_home.dart';
import 'package:security_system/page/invasion_history.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:security_system/services/notification_service.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
      MultiProvider(
          providers: [
            Provider<NotificationService>(
              create: (context) => NotificationService(),
            ),
            // Provider<FirebaseMessagingService>(
            //   create: (context) => FirebaseMessagingService(context.read<NotificationService>()),
            // ),
          ],
          child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MainPage();
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final screens = [ControlHome(), InvasionHistory()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Home Safety System',
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Home Safety System')
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Control Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_filled),
            label: 'Invasion History',
          ),
        ],
      ),
    )
    );

    /*return MaterialApp(
      title: 'Security System',
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              title: const Text('Security System')
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) => currentIndex = index,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Control Home'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.access_time_filled),
                  label: 'Invasion History'
              ),
            ],
          ),
        ),
      ),
    );*/
  }
}

