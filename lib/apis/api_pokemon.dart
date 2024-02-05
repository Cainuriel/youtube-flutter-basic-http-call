import 'package:dio/dio.dart';
import 'package:http_app/models/pokemon.dart';
import '../../controllers/controller_pokemon.dart';

class PokemonControllerImpl implements PokemonControler {
  @override
  Future<Pokemon?> getPokemon({int keyPokemon = 1}) async {
    // await Future.delayed(const Duration(seconds: 1));

    final response =
        await Dio().get('https://pokeapi.co/api/v2/pokemon/$keyPokemon');
    // final userAsString = await rootBundle.loadString('assets/jsons/user.json');
    // final json = Map<String, dynamic>.from(jsonDecode(userAsString));
    return Pokemon.fromJson(response.data);
  }
}
