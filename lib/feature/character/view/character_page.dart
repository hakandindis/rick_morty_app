import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_app/feature/character/cubit/character_cubit.dart';
import 'package:rick_morty_app/feature/character/view/character_view.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharacterCubit(),
      child: CharacterView(),
    );
  }
}
