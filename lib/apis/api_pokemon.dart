import 'package:dio/dio.dart';
import 'package:http_app/models/pokemon.dart';
import '../../controllers/controller_pokemon.dart';

class PokemonControllerImpl implements PokemonControler {
  @override
  Future<Pokemon?> getPokemon({int keyPokemon = 1}) async {

    final response =
        await Dio().get('https://pokeapi.co/api/v2/pokemon/$keyPokemon');

    return Pokemon.fromJson(response.data);
  }
}
