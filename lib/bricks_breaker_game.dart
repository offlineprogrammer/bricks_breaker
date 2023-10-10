import 'package:bricks_breaker/game_page.dart';
import 'package:bricks_breaker/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';

class BricksBreakerGame extends StatelessWidget {
  const BricksBreakerGame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp(
        builder: Authenticator.builder(),
        title: gameTitle,
        theme: ThemeData.dark(),
        home: const GamePage(title: gameTitle),
      ),
    );
  }
}
