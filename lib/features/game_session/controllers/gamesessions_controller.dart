import 'dart:async';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bricks_breaker/features/game_session/data/gamesessions_repository.dart';
import 'package:bricks_breaker/models/ModelProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'gamesessions_controller.g.dart';

@riverpod
class GameSessionsController extends _$GameSessionsController {
  Future<List<GameSession>> _fetchGameSessions() async {
    final gameSessionsRepository = ref.read(gameSessionsRepositoryProvider);
    final gameSessions = await gameSessionsRepository.getGameSessions();
    return gameSessions;
  }

  @override
  FutureOr<List<GameSession>> build() async {
    return _fetchGameSessions();
  }

  Future<void> addGameSession({
    required int score,
  }) async {
    final gameSession = GameSession(
      sessionDate: TemporalDate(DateTime.now()),
      sessionScore: score,
    );

    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final gameSessionsRepository = ref.read(gameSessionsRepositoryProvider);
      await gameSessionsRepository.add(gameSession);
      return _fetchGameSessions();
    });
  }

  Future<GameSession> getHighestScoreGameSession() async {
    final gameSessions = await _fetchGameSessions();
    final highestScoreGameSession = gameSessions.reduce(
        (currentGameSession, nextGameSession) =>
            currentGameSession.sessionScore > nextGameSession.sessionScore
                ? currentGameSession
                : nextGameSession);

    return highestScoreGameSession;
  }
}
