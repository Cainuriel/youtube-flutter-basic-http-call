import 'package:flutter/material.dart';
import 'package:http_app/models/pokemon.dart';
import 'package:http_app/controllers/controller_pokemon.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Pokemon? _pokemon;
  int idPokemon = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _init(),
    );
  }

  Future<void> _init() async {
    idPokemon++;
    final pokemon = await context
        .read<PokemonControler>()
        .getPokemon(keyPokemon: idPokemon);
    if (mounted) {
      setState(() {
        _pokemon = pokemon;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peticiones Http'),
      ),
      body: Center(
        child: _pokemon != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Nombre: ${_pokemon?.name}'),
                  if (_pokemon != null)
                    Image.network(_pokemon!.sprites.frontDefault),
                ],
              )
            : const CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _init,
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
