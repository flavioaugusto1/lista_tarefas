import 'package:flutter/material.dart';

class LevelInherited extends InheritedWidget {
  LevelInherited({
    super.key,
    required super.child,
  });

  double levelTotal = 0.00;
  double levelAcumulator = 0;
  double progressBarOverall = 0;
  int difficulty = 0;

  void updateOverallLevel() {
    levelTotal = levelTotal + levelAcumulator;
    levelAcumulator = 0;
    progressBarOverall = progressBarOverall + ((levelTotal / difficulty) / 100);
  }

  void acumulateOverAllLevel({overallLevel, difficultyTask}) {
    levelAcumulator = overallLevel / difficultyTask;
    difficulty = difficultyTask;
  }

  static LevelInherited of(BuildContext context) {
    final LevelInherited? result =
        context.dependOnInheritedWidgetOfExactType<LevelInherited>();
    assert(result != null, 'No LevelInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(LevelInherited oldWidget) {
    return oldWidget.levelTotal != levelTotal;
  }
}
