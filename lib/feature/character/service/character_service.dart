// ignore_for_file: avoid_print, empty_catches, body_might_complete_normally_nullable

import 'package:dio/dio.dart';
import 'package:rick_morty_app/feature/character/model/characters_model.dart';
import 'package:rick_morty_app/product/enums/character_filter_enums.dart';

enum CharacterApiEndPoints { character }
// enum CharacterApiFilters { name, status, species, gender }

class CharacterApiService {
  static CharacterApiService service = CharacterApiService._();

  CharacterApiService._();

  final String baseUrl = "https://rickandmortyapi.com/api/";

  final Dio _dio = Dio();

  Future<List<Results>?> fetchAllCharacters() async {
    String url = "$baseUrl${CharacterApiEndPoints.character.name}";
    //print(url);
    try {
      Response? response = await _dio.get(url).timeout(const Duration(seconds: 4));
      CharactersModel charactersModel = CharactersModel.fromJson(response.data);
      return charactersModel.results;
    } on DioError catch (e) {
      print(e);
    }
  }

  Future<List<Results>?> fetchCharacterByName(String name) async {
    String url = "$baseUrl${CharacterApiEndPoints.character.name}/?name=$name";
    print(url);

    try {
      Response? response = await _dio.get(url);
      CharactersModel charactersModel = CharactersModel.fromJson(response.data);
      return charactersModel.results;
    } on DioError catch (e) {
      print(e);
    }
  }

  Future<List<Results>?> fetchCharacterByGender(GenderTypes type) async {
    String url =
        "$baseUrl${CharacterApiEndPoints.character.name}/?gender=${type.name}";

    print(url);
    try {
      Response? response = await _dio.get(url);
      CharactersModel charactersModel = CharactersModel.fromJson(response.data);
      return charactersModel.results;
    } on DioError catch (e) {
      print(e);
    }
  }

  Future<List<Results>?> fetchCharacterByStatus(StatusTypes type) async {
    String url =
        "$baseUrl${CharacterApiEndPoints.character.name}/?status=${type.name}";

    print(url);

    try {
      Response? response = await _dio.get(url);
      CharactersModel charactersModel = CharactersModel.fromJson(response.data);
      return charactersModel.results;
    } on DioError catch (e) {
      print(e);
    }
  }
}
