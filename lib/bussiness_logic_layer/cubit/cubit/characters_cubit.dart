import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data_layer/models/characters_class.dart';
import '../../../data_layer/repository/character_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepsitory characterRepsitory;
  List<Character> characters=[];
  CharactersCubit(this.characterRepsitory) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    characterRepsitory.getAllData().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });

    return characters;
  }
}
