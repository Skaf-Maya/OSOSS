import 'package:get/get.dart';
import 'package:ososs_test/controller/home_screen_controller.dart';
import 'package:ososs_test/controller/page_one_screen_controller.dart';
import 'package:ososs_test/controller/page_two_screen_controller.dart';
import 'package:ososs_test/controller/splash_screen_controller.dart';
import 'package:ososs_test/data/api/api_client.dart';
import 'package:ososs_test/data/repository/pokemon_repo.dart';
import 'package:ososs_test/utils/app_constants.dart';

void init() async {

  /// Core
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl));

  /// Repository
  Get.lazyPut(() => PokemonRepo(apiClient: Get.find()));

  /// Controller
  Get.lazyPut(() => SplashScreenController());
  Get.lazyPut(() => HomeScreenController());
  Get.lazyPut(() => PageOneScreenController());
  Get.lazyPut(() => PageTwoScreenController(pokemonRepo: Get.find()));

}
