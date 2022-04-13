import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    const CalenderApp(),
  );
}

class CalenderApp extends StatelessWidget {
  const CalenderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],

        // Define the default font family.
        fontFamily: 'Poppins',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const BackGround(),
            const DrawerScreen(),
            // main screen
            // we will wrap our main screen in a tween animation builder.
            // which will allow us to animate it.

            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: const Duration(milliseconds: 250),
              builder: (context, double val, _) {
                return (Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * val)
                    ..rotateY((pi * val) / 6),
                  child: Scaffold(
                    body: Container(
                      color: Colors.blue[600]!,
                      child: const Center(
                        child: Text('Swipe right to open the menu'),
                      ),
                    ),
                  ),
                ));
              },
            ),

            GestureDetector(
              onHorizontalDragEnd: (_) {
                setState(() {
                  value == 0 ? value = 1 : value = 0;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                        'https://cdn.dribbble.com/users/1577045/screenshots/4914645/media/028d394ffb00cb7a4b2ef9915a384fd9.png?compress=1&resize=400x300&vertical=top'),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Houssem Bousmaha',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.person),
                    title: const Text('Profile'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.logout),
                    title: const Text('Log out'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BackGround extends StatelessWidget {
  const BackGround({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[400]!, Colors.blue[800]!],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
    );
  }
}
