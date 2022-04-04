import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_morty_app/feature/character/model/characters_model.dart';
import 'package:rick_morty_app/feature/character/service/character_service.dart';
import 'package:rick_morty_app/product/enums/character_filter_enums.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit() : super(CharacterState());

  Future<void> getAllCharacters() async {
    emit(state.copyWith(pageStates: PageStates.waiting));

    try {
      final List<Results>? response =
          await CharacterApiService.service.fetchAllCharacters();

      emit(state.copyWith(
          results: response ?? [], pageStates: PageStates.success));
    } catch (e) {
      emit(state.copyWith(pageStates: PageStates.failure));
    }
  }

  Future<void> getCharacterByName(String name) async {
    emit(state.copyWith(pageStates: PageStates.waiting));

    try {
      final List<Results>? response =
          await CharacterApiService.service.fetchCharacterByName(name);

      emit(state.copyWith(
          results: response ?? [], pageStates: PageStates.success));
    } catch (e) {
      emit(state.copyWith(pageStates: PageStates.failure));
    }
  }

  Future<void> getCharacterByStatus(StatusTypes type) async {
    emit(state.copyWith(pageStates: PageStates.waiting));

    try {
      final List<Results>? response =
          await CharacterApiService.service.fetchCharacterByStatus(type);

      emit(state.copyWith(
          results: response ?? [], pageStates: PageStates.success));
    } catch (e) {
      emit(state.copyWith(pageStates: PageStates.failure));
    }
  }

  Future<void> getCharacterByGender(GenderTypes type) async {
    emit(state.copyWith(pageStates: PageStates.waiting));

    try {
      final List<Results>? response =
          await CharacterApiService.service.fetchCharacterByGender(type);

      emit(state.copyWith(
          results: response ?? [], pageStates: PageStates.success));
    } catch (e) {
      emit(state.copyWith(pageStates: PageStates.failure));
    }
  }
}
