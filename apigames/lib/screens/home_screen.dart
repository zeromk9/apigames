import 'package:apigames/providers/providersGames.dart';
import 'package:apigames/widgets/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gamesProvider = Provider.of<GamesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
/*         actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_outlined),
          )
        ], */
        title: const Center(
          child: Text('GAMES'),
        ),
      ),
      body: Column(
        children: [
          CardSwiper(
            games: gamesProvider.onDisplayGames,
          ),
        ],
      ),
    );
  }
}
