import 'package:flutter/material.dart';
import 'package:budget_tracker/pages/home.dart';
import 'package:budget_tracker/pages/display.dart';
import 'package:budget_tracker/pages/loading.dart';
import 'package:budget_tracker/pages/entry_popup.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => const Loading(),
    '/home': (context) => const Home(),
    '/list': (context) => const Display(),
    '/entry': (context) => const Entry(),
  },
));