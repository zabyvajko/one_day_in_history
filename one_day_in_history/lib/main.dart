import 'package:flutter/material.dart';
import 'package:one_day_in_history/routes/routes.dart';

void main() {
  runApp(const OneDayInHistoryApp());
}

class OneDayInHistoryApp extends StatelessWidget {
  const OneDayInHistoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'One Day In History',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: routes,
    );
  }
}


