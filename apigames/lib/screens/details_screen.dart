import 'package:apigames/models/models.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final GamesList game =
        ModalRoute.of(context)?.settings.arguments as GamesList;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.cyan, title: Text(game.title)),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate.fixed([_GameName(game: game)]),
          ),
        ],
      ),
    );
  }
}

class _GameName extends StatelessWidget {
  const _GameName({super.key, required this.game});
  final GamesList game;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          alignment: Alignment.topLeft,
          child: Text(
            game.title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          alignment: Alignment.topLeft,
          child: Text(
            game.shortDescription,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: FadeInImage(
            placeholder: const AssetImage(
                'assets/imgs/nodata.jpg'), // Imagen de carga antes de cargar la real.
            image: NetworkImage(
                game.gameImage), // Imagen real del póster desde la red.
            height: 200,
          ),
        ),
      ],
    );
  }
}
