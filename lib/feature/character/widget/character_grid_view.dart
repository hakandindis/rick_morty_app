import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_app/feature/character/cubit/character_cubit.dart';
import 'package:rick_morty_app/feature/character/model/characters_model.dart';
import 'package:rick_morty_app/feature/character/widget/character_card.dart';

class CharacterGridView extends StatelessWidget {
  CharacterGridView({
    Key? key,
    this.state,
  }) : super(key: key);

  final CharacterState? state;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          itemCount: state == null ? 10 : state?.results.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio: 0.7),
          itemBuilder: (context, index) {
            Results? result = state?.results[index];
            if (state == null) {
              return CharacterCard();
            } else {
              return CharacterCard(result: result);
            }
          }),
    );
  }
}
