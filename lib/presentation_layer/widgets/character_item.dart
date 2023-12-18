import 'package:breaking_bad/constants/colors.dart';
import 'package:breaking_bad/data_layer/models/characters_class.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
              color: MyColors.myWhite,
              borderRadius: BorderRadius.circular(9),
               ),
      child: GridTile(child: 
      Container(
        color: MyColors.myGrey,
         child:character.thumbnailUrl!.isNotEmpty? FadeInImage.assetNetwork(placeholder: "assets/images/loadingx.gif",
          image: character.thumbnailUrl!,fit: BoxFit.cover,):
         Image.asset("assets/images/loadingx.gif")
      ),
      footer: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        color:Colors.black54,
        alignment: Alignment.bottomCenter,
        child: Text("${character.title}",style: TextStyle(
          height: 1.3,
          fontSize: 16,
          color: MyColors.myWhite,
          fontWeight: FontWeight.bold
        ),
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        maxLines: 2,),

      ),
      ),
    );
  }
}
