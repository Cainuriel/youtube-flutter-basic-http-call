import '../models/pokemon.dart';

abstract class PokemonControler {
  Future<Pokemon?> getPokemon({int keyPokemon = 1});
}
