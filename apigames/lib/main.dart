import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apigames/providers/providers.dart';
import 'package:apigames/screens/screens.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GamesProvider(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MONSTER HUNTER',
      initialRoute: '/home',
      routes: {
        '/home': (_) => const HomeScreen(),
        '/details': (_) => const DetailsScreen()
      },
    );
  }
}
