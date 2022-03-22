import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_app/feature/character/cubit/character_cubit.dart';
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
      body: BlocBuilder<CharacterCubit, CharacterState>(
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
              return Center(child: CircularProgressIndicator());
            case PageStates.failure:
              return Center(
                child: Text(
                  "Characters couldnt uploaded",
                  style: Theme.of(context).textTheme.headline4,
                ),
              );
            case PageStates.success:
              return ListView.builder(
                itemCount: state.results.length,
                itemBuilder: (context, index) {
                  Results? result = state.results[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(result?.image ?? ""),
                    ),
                    title: Text(result?.name ?? ""),
                    subtitle: Column(
                      children: [
                        Text(result?.status ?? "We dont know"),
                        Text(result?.gender ?? "We dont know"),
                      ],
                    ),
                  );
                },
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CharacterCubit>().getAllCharacters(),
        child: Icon(Icons.download),
      ),
    );
  }

  Widget buildOldScaffold() {
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
