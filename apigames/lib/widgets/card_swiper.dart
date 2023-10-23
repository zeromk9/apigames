import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:apigames/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<GamesList> games;
  const CardSwiper({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: games.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.6,
        itemBuilder: (_, int index) {
          final game = games[index];
          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: game),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(game.gameImage),
              ),
            ),
          );
        },
      ),
    );
  }
}
