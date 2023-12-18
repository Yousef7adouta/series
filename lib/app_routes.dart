import 'package:breaking_bad/bussiness_logic_layer/cubit/cubit/characters_cubit.dart';
import 'package:breaking_bad/data_layer/repository/character_repository.dart';
import 'package:breaking_bad/data_layer/web_services/characters_webservices.dart';
import 'package:breaking_bad/presentation_layer/screans/characters_details.dart';
import 'package:breaking_bad/presentation_layer/screans/characters_screan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants/strings.dart';

class AppRoutes {
  late CharacterRepsitory characterRepsitory;
  late CharactersCubit charactersCubit;
  AppRoutes() {
    characterRepsitory = CharacterRepsitory(CharacterWebServices());
    charactersCubit = CharactersCubit(characterRepsitory);
  }

  Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      CharactersCubit(characterRepsitory),
                  child:const CharacterScrean(),
                ));
      case charactersDetailsScreen:
        return MaterialPageRoute(builder: (_) =>const CharactersScreanDetails());
    }
    return null;
  }
}
