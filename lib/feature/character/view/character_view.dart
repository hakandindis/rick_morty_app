import 'package:flutter/material.dart';
import 'package:rick_morty_app/feature/character/model/characters_model.dart';
import 'package:rick_morty_app/feature/character/service/character_service.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 500,
          child: Expanded(
              child: FutureBuilder<List<Results>?>(
            future: CharacterApiService.service.fetchAllCharacters(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(snapshot.data![index].id.toString()),
                      title: Image.network(
                        "${snapshot.data?[index].image}",
                        height: 200,
                      ),
                    );
                  },
                );
              }
            },
          )),
        ),
      ),
    );
  }
}
