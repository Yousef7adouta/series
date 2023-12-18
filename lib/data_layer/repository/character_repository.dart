
import '../models/characters_class.dart';
import '../web_services/characters_webservices.dart';

class CharacterRepsitory {
  final CharacterWebServices characterWebServices;

  CharacterRepsitory(this.characterWebServices);
  Future<List<Character>> getAllData() async {
    final character = await characterWebServices.getAllCharacters();
    return character.map((character) => Character.fromJson(character)).toList();
  }
}
