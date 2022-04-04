import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_app/feature/character/cubit/character_cubit.dart';
import 'package:rick_morty_app/feature/character/model/characters_model.dart';
import 'package:rick_morty_app/feature/character/widget/character_card.dart';

class CharacterGridView extends StatelessWidget {
  const CharacterGridView({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        PageStates pageStates = state.pageStates;

        switch (pageStates) {
          case PageStates.initial:
            return Center(
              child: Text(
                "CHARACTER PAGE",
                style: Theme.of(context).textTheme.headline4,
              ),
            );
          case PageStates.waiting:
            return const Center(child: const CircularProgressIndicator());
          case PageStates.failure:
            return Center(
              child: Text(
                "Characters couldnt uploaded",
                style: Theme.of(context).textTheme.headline4,
              ),
            );
          case PageStates.success:
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  itemCount: state.results.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 0.8),
                  itemBuilder: (context, index) {
                    Results? result = state.results[index];
                    return CharacterCard(result: result);
                  }),
            );
        }
      },
    );
  }
}
