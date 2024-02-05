import 'package:flutter/material.dart';
import 'package:http_app/apis/api_pokemon.dart';
import 'package:http_app/config/theme/app_theme.dart';
import 'package:http_app/controllers/controller_pokemon.dart';

import 'package:http_app/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<PokemonControler>(
          create: (_) => PokemonControllerImpl(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const HomeScreen());
  }
}
