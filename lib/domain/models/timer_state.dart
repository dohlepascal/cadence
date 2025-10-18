enum TimerPhase { idle, work, rest, finished }

class TimerState {
  final Duration remaining;
  final TimerPhase phase;
  final int round;
  final bool isRunning;

  const TimerState({
    required this.remaining,
    required this.phase,
    required this.round,
    required this.isRunning,
  });

  TimerState copyWith({
    Duration? remaining,
    TimerPhase? phase,
    int? round,
    bool? isRunning,
  }) {
    return TimerState(
      remaining: remaining ?? this.remaining,
      phase: phase ?? this.phase,
      round: round ?? this.round,
      isRunning: isRunning ?? this.isRunning,
    );
  }

  static const initial = TimerState(
    remaining: Duration.zero,
    phase: TimerPhase.idle,
    round: 0,
    isRunning: false,
  );
}
