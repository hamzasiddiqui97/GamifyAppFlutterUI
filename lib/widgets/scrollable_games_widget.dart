import 'package:flutter/material.dart';
import 'package:gamify_app/data.dart';

class ScrollableGamesWidget extends StatelessWidget {
  final double height;
  final double width;
  final bool showTitle;
  final List<Game> gameData;

  const ScrollableGamesWidget({
    super.key,
    required this.height,
    required this.width,
    required this.showTitle,
    required this.gameData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: gameData.map((game) {
          return Container(
            padding: EdgeInsets.only(right: width * 0.03),
            margin: const EdgeInsets.all(3.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: height * 0.70,
                  width: width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(game.coverImage.url),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Text(
                  game.title,
                  maxLines: 2,
                  style: TextStyle(color: Colors.white,fontSize: height * 0.09),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
