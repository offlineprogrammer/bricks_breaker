import 'dart:async';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bricks_breaker/models/ModelProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final gameSessionsAPIServiceProvider = Provider<GameSessionsAPIService>((ref) {
  final service = GameSessionsAPIService();
  return service;
});

class GameSessionsAPIService {
  GameSessionsAPIService();

  Future<List<GameSession>> getGameSessions() async {
    try {
      final request = ModelQueries.list(GameSession.classType);
      final response = await Amplify.API.query(request: request).response;

      final gameSessions =
          response.data?.items.map((e) => e as GameSession).toList();
      if (gameSessions == null) {
        safePrint('getGameSessions errors: ${response.errors}');
        return const [];
      }
      gameSessions.sort(
        (a, b) =>
            a.sessionDate.getDateTime().compareTo(b.sessionDate.getDateTime()),
      );
      return gameSessions;
    } on Exception catch (error) {
      safePrint('getGameSessions failed: $error');

      return const [];
    }
  }

  Future<void> addGameSession(GameSession gameSession) async {
    try {
      final request = ModelMutations.create(gameSession);
      final response = await Amplify.API.mutate(request: request).response;

      final createdGameSession = response.data;
      if (createdGameSession == null) {
        safePrint('addGameSession errors: ${response.errors}');
        return;
      }
    } on Exception catch (error) {
      safePrint('addGameSession failed: $error');
    }
  }
}
