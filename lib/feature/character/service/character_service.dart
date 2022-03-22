import 'package:dio/dio.dart';
import 'package:rick_morty_app/feature/character/model/characters_model.dart';

enum CharacterApiEndPoints { character }
enum CharacterApiFilters { name, status, species, gender }

class CharacterApiService {
  static CharacterApiService service = CharacterApiService._();

  CharacterApiService._();

  final String baseUrl = "https://rickandmortyapi.com/api/";

  Dio _dio = Dio();

  Future<List<Results>?> fetchAllCharacters() async {
    String url = "$baseUrl${CharacterApiEndPoints.character.name}";
    //print(url);
    try {
      Response? response = await _dio.get(url);
      CharactersModel charactersModel = CharactersModel.fromJson(response.data);
      return charactersModel.results;
    } on DioError catch (e) {
      print(e);
    }
  }

  fetchSingleCharacter(String name) async {
    String url = "$baseUrl${CharacterApiEndPoints.character.name}";
  }
}
