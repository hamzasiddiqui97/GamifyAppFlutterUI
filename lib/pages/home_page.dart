import 'package:flutter/material.dart';
import 'package:gamify_app/data.dart';
import 'package:gamify_app/widgets/scrollable_games_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _deviceHeight;
  var _deviceWidth;
  var _selectedGame;

  @override
  void initState() {
    super.initState();
    _selectedGame = 0;
  }

  @override
  Widget build(BuildContext context) {

    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            _featuredGamesWidget(),
            _gradientBoxWidget(),
            _topLayerWidget(),
          ],
        ),
      ),
    );
  }

  Widget _featuredGamesWidget() {
    return SizedBox(
        height: _deviceHeight * 0.5,
        width: _deviceWidth,
        child: PageView(
          onPageChanged: (_index) {
            setState(() {
              _selectedGame = _index;
            });
          },
          scrollDirection: Axis.horizontal,
          children: featuredGames.map((_game) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(_game.coverImage.url),
              )),
            );
          }).toList(),
        ));
  }

  Widget _gradientBoxWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: _deviceHeight * 0.80,
        width: _deviceWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.65, 1.0],
            colors: [
              Color.fromRGBO(35, 46, 59, 1.0),
              Colors.transparent,
            ],
          ),
        ),
      ),
    );
  }

  Widget _topLayerWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: _deviceWidth * 0.04, vertical: _deviceHeight * 0.03),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _topBarWidget(),
          SizedBox(
            height: _deviceHeight * 0.10,
          ),
          _featuredGamesInfoWidget(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: _deviceHeight * 0.01),
            child: ScrollableGamesWidget(
                height: _deviceHeight * 0.24,
                width: _deviceWidth,
                showTitle: true,
                gameData: games),
          ),
          _featureGameBannerWidget(),

          ScrollableGamesWidget(height: _deviceHeight *0.22, width: _deviceWidth, showTitle: false, gameData: games2)
        ],
      ),
    );
  }

  Widget _topBarWidget() {
    return SizedBox(
      height: _deviceHeight * 0.13,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          Row(
            children: [
              const Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: _deviceWidth * 0.03,
              ),
              const Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 30,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _featuredGamesInfoWidget() {
    return SizedBox(
      height: _deviceHeight * 0.12,
      width: _deviceWidth,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            featuredGames[_selectedGame].title,
            maxLines: 2,
            style: TextStyle(
              fontSize: _deviceHeight * 0.050,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: _deviceHeight * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: featuredGames.map((_game) {
              double _circleRadius = _deviceHeight * 0.005;
              bool _isActice =
                  _game.title == featuredGames[_selectedGame].title;
              return Container(
                margin: EdgeInsets.only(right: _deviceWidth * 0.015),
                decoration: BoxDecoration(
                  color: _isActice ? Colors.green : Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                ),
                height: _circleRadius * 2,
                width: _circleRadius * 2,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  _featureGameBannerWidget() {

    return Container(
      height: _deviceHeight * 0.13,
      width: _deviceWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),

        image: DecorationImage(

          fit: BoxFit.fill,
          image: NetworkImage(featuredGames[2].coverImage.url),
        ),
      ),
    );
  }
}
