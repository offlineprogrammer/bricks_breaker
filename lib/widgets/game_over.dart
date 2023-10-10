import 'package:bricks_breaker/bricks_breaker.dart';
import 'package:bricks_breaker/features/game_session/controllers/gamesessions_controller.dart';
import 'package:bricks_breaker/features/game_session/ui/gamesessions_highest_score.dart';
import 'package:bricks_breaker/utils/constants.dart';
import 'package:bricks_breaker/widgets/game_button.dart';
import 'package:bricks_breaker/widgets/game_score.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameOver extends StatelessWidget {
  const GameOver({
    super.key,
    required this.game,
  });

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(panelColor),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer(builder: (context, ref, child) {
            Future(() {
              ref.watch(gameSessionsControllerProvider.notifier).addGameSession(
                    score: (game as BricksBreaker).gameManager.score.value,
                  );
            });

            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    'GAME OVER',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'SCORE',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(height: 10),
                GameScore(
                  game: game,
                ),
                const SizedBox(height: 20),
                const Text(
                  'HIGHEST SCORE',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(height: 10),
                const GameHighestScore(),
                const SizedBox(height: 20),
                GameButton(
                  onPressed: () {
                    (game as BricksBreaker).resetGame();
                  },
                  title: 'TRY AGAIN',
                  color: continueButtonColor,
                  width: 200,
                ),
                const SizedBox(height: 10),
              ],
            );
          }),
        ),
      ),
    );
  }
}
