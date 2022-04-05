import 'package:flutter/material.dart';
import 'package:rick_morty_app/feature/character/model/characters_model.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    Key? key,
    this.result,
  }) : super(key: key);

  final Results? result;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: result == null
                ? Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(25),
                    ),
                  )
                : Image.network(result?.image ?? "")),
        result == null
            ? Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.02,
                    width: MediaQuery.of(context).size.width * 0.2,
                    color: Colors.grey[300],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.02,
                    width: MediaQuery.of(context).size.width * 0.2,
                    color: Colors.grey[300],
                  ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Status: ${result?.status ?? "We dont know"}",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "Gender: ${result?.gender ?? "We dont know"}",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
