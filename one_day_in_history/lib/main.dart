import 'package:flutter/material.dart';

void main() {
  runApp(const OneDayInHistoryApp());
}

class OneDayInHistoryApp extends StatelessWidget {
  const OneDayInHistoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'One Day In History',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/':(context) => const HomePageScreen(),
      },
    );
  }
}

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      drawer: const NavigationDrawer(),
      body: const SizedBox(
        child: Center(child: Text('123')),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItem(context),
          ],
        ),
      ),
    );
  }
  
  Widget buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
    );
  }
  
  Widget buildMenuItem(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Favorite facts'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Settings'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
