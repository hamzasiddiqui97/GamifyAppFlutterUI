import 'package:flutter/material.dart';
import 'package:gamify_app/data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _deviceHeight;
  var _deviceWidth;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          _featuredGamesWidget(),
          _gradientBoxWidget(),
        ],
      ),
    );
  }

  Widget _featuredGamesWidget(){
    return SizedBox(
      height: _deviceHeight * 0.5,
      width: _deviceWidth,
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: featuredGames.map((_game) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(_game.coverImage!.url),)
            ),
          );
        }).toList(),
      )
    );
  }





  _gradientBoxWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: _deviceHeight* 0.80,
        width: _deviceWidth,
        decoration: const BoxDecoration(


            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.65, 1.0],
                colors: [
                  Color.fromRGBO(35, 46, 59, 1.0),
                  Colors.transparent,

                ])),
      ),
    );
  }
}
