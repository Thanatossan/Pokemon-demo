import 'package:go_router/go_router.dart';

import '../../features/pokemon/presentation/pages/pokemon_page.dart';

final router = GoRouter(initialLocation: PokemonHomePage.routeName, routes: [
  GoRoute(
      path: PokemonHomePage.routeName,
      builder: (context, state) => PokemonHomePage())
]);
