import 'package:breaking_bad/constants/colors.dart';
import 'package:breaking_bad/presentation_layer/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bussiness_logic_layer/cubit/cubit/characters_cubit.dart';
import '../../data_layer/models/characters_class.dart';

class CharacterScrean extends StatefulWidget {
  const CharacterScrean({super.key});

  @override
  State<CharacterScrean> createState() => _CharacterScreanState();
}

class _CharacterScreanState extends State<CharacterScrean> {
  late List<Character> allcharacters;
  @override
  void initState() {
    super.initState();
    allcharacters =
        BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBlockWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      if (state is CharactersLoaded) {
        allcharacters = (state).characters;
        return buildLoadedListWidget();
      } else {
        return showLoadingIndictor();
      }
    });
  }

  Widget showLoadingIndictor() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [buildCharactersList()],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemCount: allcharacters.length,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return CharacterItem(character: allcharacters[index],);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: Text(
          "Characters",
          style: TextStyle(color: MyColors.myGrey),
        ),
      ),
      body: buildBlockWidget(),
    ));
  }
}
