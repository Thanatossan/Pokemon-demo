import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/injector.dart';

import '../bloc/pokemon_bloc.dart';

class PokemonHomePage extends StatelessWidget {
  static const String routeName = '/pokemon';
  PokemonHomePage({super.key});
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PokeDex by Sivakorn'),
        ),
        body: buildBody());
  }

  BlocProvider<PokemonBloc> buildBody() {
    return BlocProvider(
      create: (_) => injector<PokemonBloc>()..add(const GetAllPokemonLocal()),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  if (state is PokemonInitialState) ...[
                    const Text('Start searching!')
                  ] else if (state is PokemonLoadingState) ...[
                    const CircularProgressIndicator()
                  ] else if (state is ShowCurrentPokemonState) ...[
                    Image.network(state.pokemon.sprite ??
                        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png"),
                    Text(state.pokemon.id.toString()),
                    Text(state.pokemon.name ?? ""),
                    SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          if (BlocProvider.of<PokemonBloc>(context)
                                  .currentPokemon !=
                              null) {
                            BlocProvider.of<PokemonBloc>(context).add(
                                CatchPokemon(
                                    pokemonEntity:
                                        BlocProvider.of<PokemonBloc>(context)
                                            .currentPokemon!));
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Error"),
                                  content: const Text(
                                      "Please search for a pokemon first"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Close"),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                          controller.clear();
                        },
                        child: const Text("Catch this Pokemon!")),
                  ] else if (state is PokemonErrorState) ...[
                    const Text('Cannot find pokemon!'),
                  ] else if (state is ReleasePokemonState) ...[
                    const Text('Release Pokemon success!'),
                  ] else if (state is CatchPokemonState) ...[
                    const Text('Pokemon is caught!'),
                  ],
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Input a pokemon name',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            if (controller.text.isNotEmpty) {
                              BlocProvider.of<PokemonBloc>(context)
                                  .add(GetPokemonByName(name: controller.text));
                              controller.clear();
                            }
                          },
                          child: const Text("Search by name")),
                      ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<PokemonBloc>(context)
                                .add(const GetPokemonById());
                            controller.clear();
                          },
                          child: const Text("Search Random")),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text("Pokedex"),
                  Column(
                    children: BlocProvider.of<PokemonBloc>(context)
                        .pokemons
                        .map((e) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(e.sprite ??
                                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png"),
                                SizedBox(width: 10),
                                Text(e.id.toString()),
                                SizedBox(width: 10),
                                Text(e.name ?? ""),
                                ElevatedButton(
                                    onPressed: () {
                                      BlocProvider.of<PokemonBloc>(context)
                                          .add(ReleasePokemonById(id: e.id));
                                    },
                                    child: const Text("Release"))
                              ],
                            ))
                        .toList(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
