import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:one_day_in_history/repositories/one_day_in_history/one_day_in_history_repository.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  String todayDate = '';
  String oneHistory = '';
  @override
  void initState() {
    super.initState();
    loadInfo();
    oneDayInHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const NavigationDrawer(),
      body: Center(
        child: Column(
          children: [
            Text(
              todayDate,
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              oneHistory,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  /// loads device info
  void loadInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      await deviceInfoPlugin.androidInfo;
    } else if (Platform.isIOS) {
      await deviceInfoPlugin.iosInfo;
    }
    final now = DateTime.now();
    String currentDate = '${now.month}-${now.day}';
    setState(() {
      todayDate = currentDate;
    });
    Text('Поточна дата: $currentDate');
  }

  void oneDayInHistory() async {
    final dio = Dio();
    final todayDate = DateTime.now();
    final dateQuery =
        '${todayDate.month}/${todayDate.day}/date'; // format must be "month/day/date"
    final response = await dio.get('http://numbersapi.com/$dateQuery');
    setState(() {
      oneHistory = response.data;
    });
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
