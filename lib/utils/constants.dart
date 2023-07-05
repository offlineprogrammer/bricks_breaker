import 'package:flutter/material.dart';

enum BallState {
  ideal,
  drag,
  release,
  completed,
}

const ballRadius = 10.0;

const ballColor = 0xFFFFFFFF;

const brickColor = 0xFF24998B;
const brickFontColor = 0xFFFFFFFF;
const brickFontSize = 20.0;

const numberOfBricksInRow = 7;
const brickPadding = 8;
const maxValueOfBrick = 10;
const minValueOfBrick = -5;

const panelColor = 0xFF1B1B1B;

const Color startButtonColor = Color.fromRGBO(235, 32, 93, 1);
const Color continueButtonColor = Color.fromRGBO(235, 32, 93, 1);
const Color restartButtonColor = Color.fromRGBO(243, 181, 45, 1);

const String gameTitle = 'The BricksBreaker Game';
