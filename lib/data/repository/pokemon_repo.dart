import 'package:get/get.dart';
import 'package:ososs_test/data/api/api_client.dart';
import 'package:ososs_test/utils/app_constants.dart';

class PokemonRepo {
  final ApiClient apiClient;
  PokemonRepo({required this.apiClient});

  Future<Response> getPokemonList() async {
    return await apiClient.getData(AppConstants.pokemonList);
  }
  Future<Response> getPokemonImagesList(String name) async {
    return await apiClient.getData("${AppConstants.pokemonList}/$name");
  }
}