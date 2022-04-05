// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_app/feature/character/cubit/character_cubit.dart';
import 'package:rick_morty_app/feature/character/widget/character_grid_view.dart';

class CharacterView extends StatefulWidget {
  const CharacterView({Key? key}) : super(key: key);

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      // floatingActionButton: const CharacterFloatingButton(),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }

  AppBar buildAppBar() => AppBar(
        title: Text("RICK & MORTY"),
      );

  Widget buildBody() {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        PageStates pageStates = state.pageStates;

        switch (pageStates) {
          case PageStates.initial:
            return CharacterGridView();
          case PageStates.waiting:
            return Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurple[300],
              ),
            );
          case PageStates.failure:
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Characters couldn't uploaded",
                  style: TextStyle(
                    color: Colors.deepPurple[300],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          case PageStates.success:
            return CharacterGridView(state: state);
        }
      },
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.read<CharacterCubit>().getAllCharacters(),
      child: const Icon(Icons.download),
    );
  }
}
