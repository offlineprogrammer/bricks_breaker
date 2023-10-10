import 'package:bricks_breaker/features/game_session/services/gamesessions_api_service.dart';
import 'package:bricks_breaker/models/ModelProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final gameSessionsRepositoryProvider = Provider<GameSessionsRepository>((ref) {
  final gameSessionsAPIService = ref.read(gameSessionsAPIServiceProvider);
  return GameSessionsRepository(gameSessionsAPIService);
});

class GameSessionsRepository {
  GameSessionsRepository(this.gameSessionsAPIService);

  final GameSessionsAPIService gameSessionsAPIService;

  Future<List<GameSession>> getGameSessions() {
    return gameSessionsAPIService.getGameSessions();
  }

  Future<void> add(GameSession gameSession) async {
    return gameSessionsAPIService.addGameSession(gameSession);
  }
}
