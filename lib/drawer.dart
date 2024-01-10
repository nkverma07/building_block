import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});
  static const appTitle = 'Drawer Demo';
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: DrawerScreen(
        title: appTitle,
      ),
    );
  }
}

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key, required this.title});
  final String title;
  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 28, fontWeight: FontWeight.bold
  );
  static const List<Widget> _widgetOption = [
    Text('Index 0: HOME',
    style: optionStyle,
    ),
    Text('Index 1: PROFILE',
    style: optionStyle,
    ),
    Text('Index 2: ABOUT',
    style: optionStyle,
    ),
  ];
  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: _widgetOption[_selectedIndex]),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text('Drawer Header')),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('PROFILE'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('ABOUT'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onTapped(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
