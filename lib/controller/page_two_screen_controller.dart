import 'package:get/get.dart';
import 'package:ososs_test/data/model/pokemon_details_model.dart';
import 'package:ososs_test/data/model/pokemon_list_model.dart';
import 'package:ososs_test/data/repository/pokemon_repo.dart';

class PageTwoScreenController extends GetxController implements GetxService {

  final PokemonRepo pokemonRepo;
  PageTwoScreenController({required this.pokemonRepo});

  RxList<String>? pokemonList = RxList<String>([]);
  RxList<Sprites?>? sprites = RxList<Sprites?>([]);
  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getPokemonList();
  }

  Future<void> getPokemonList() async {
    loading.value = true;
    if (pokemonList!.isEmpty) {
      Response response = await pokemonRepo.getPokemonList();
      if (response.statusCode == 200) {
        PokemonListModel pokemonModel = PokemonListModel.fromJson(
            response.body);
        pokemonList!.addAll(pokemonModel.results!.map((e) => e.name!).toList());
      }
    }
    for (String pokemonName in pokemonList!) {
      Response response2 = await pokemonRepo.getPokemonImagesList(pokemonName);
      if (response2.statusCode == 200) {
        PokemonDetailModel pokemonDetailModel = PokemonDetailModel.fromJson(
            response2.body);
        sprites!.add(pokemonDetailModel.sprites);
        loading.value = false;
      }
    }
    update();
  }
}