import 'package:bricks_breaker/features/game_session/controllers/gamesessions_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameHighestScore extends ConsumerWidget {
  const GameHighestScore({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref
          .read(gameSessionsControllerProvider.notifier)
          .getHighestScoreGameSession(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data!.sessionScore.toString(),
            style: const TextStyle(
              fontSize: 30,
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
