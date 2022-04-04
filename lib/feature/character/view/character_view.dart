import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_app/feature/character/cubit/character_cubit.dart';
import 'package:rick_morty_app/feature/character/model/characters_model.dart';
import 'package:rick_morty_app/feature/character/service/character_service.dart';
import 'package:rick_morty_app/feature/character/widget/character_grid_view.dart';
import 'package:rick_morty_app/product/enums/character_filter_enums.dart';

class CharacterView extends StatefulWidget {
  const CharacterView({Key? key}) : super(key: key);

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const CharacterGridView(),
      // floatingActionButton: const CharacterFloatingButton(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CharacterCubit>().getAllCharacters(),
        child: const Icon(Icons.download),
      ),
    );
  }
}

class CharacterFloatingButton extends StatelessWidget {
  const CharacterFloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () => context
              .read<CharacterCubit>()
              .getCharacterByGender(GenderTypes.genderless),
          child: const Icon(Icons.male),
        ),
        FloatingActionButton(
          onPressed: () => context
              .read<CharacterCubit>()
              .getCharacterByStatus(StatusTypes.dead),
          child: const Icon(Icons.heart_broken_rounded),
        ),
        FloatingActionButton(
          onPressed: () =>
              context.read<CharacterCubit>().getCharacterByName("morty"),
          child: const Icon(Icons.abc_rounded),
        ),
        FloatingActionButton(
          onPressed: () => context.read<CharacterCubit>().getAllCharacters(),
          child: const Icon(Icons.download),
        ),
      ],
    );
  }
}


