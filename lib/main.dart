import 'package:flutter/material.dart';
import 'package:balance/screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

/// Tämä on pääwidget, joka käynnistää sovelluksen. Se käyttää ProviderScopea,
/// joka on Riverpodin tapa tarjota tilaa koko sovellukselle.
/// MainApp on yksinkertainen MaterialApp, joka näyttää HomeScreenin.
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen(), debugShowCheckedModeBanner: false);
  }
}
