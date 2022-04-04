import 'package:flutter/material.dart';
import 'package:rick_morty_app/feature/character/model/characters_model.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    Key? key,
    required this.result,
  }) : super(key: key);

  final Results? result;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(result?.image ?? "")),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                  "Status: ${result?.status ?? "We dont know"}"),
              Text(
                  "Gender: ${result?.gender ?? "We dont know"}"),
            ],
          ),
        ),
      ],
    );
  }
}