class Habit {
  final String id;
  final String name;
  final String emoji;
  final String color;
  final String progress;
  bool completed;

  Habit({
    required this.id,
    required this.name,
    required this.emoji,
    required this.color,
    required this.progress,
    this.completed = false,
  });

  // Mock habits for initial testing
  static List<Habit> getMockHabits() {
    return [
      Habit(
        id: '1',
        name: 'Study',
        emoji: '📚',
        color: 'green',
        progress: '00:00/02:00:00',
      ),
      Habit(
        id: '2',
        name: 'Flossing',
        emoji: '🦷',
        color: 'yellow',
        progress: 'Not completed',
      ),
      Habit(
        id: '3',
        name: 'Read a book',
        emoji: '📖',
        color: 'purple',
        progress: '00:00/45:00',
      ),
      Habit(
        id: '4',
        name: 'Limit Coffee',
        emoji: '☕',
        color: 'red',
        progress: '1/5 Coffees',
      ),
      Habit(
        id: '5',
        name: 'Yoga',
        emoji: '🧘',
        color: 'pink',
        progress: '00:00/30:00',
      ),
      Habit(
        id: '6',
        name: 'Drink water',
        emoji: '💧',
        color: 'blue',
        progress: '2/4 Glasses',
      ),
    ];
  }
}
