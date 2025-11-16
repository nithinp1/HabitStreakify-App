import 'package:flutter/material.dart';
import '../models/habit.dart';
import '../widgets/habit_card.dart';
import '../widgets/add_habit_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Habit> habits = [];

  @override
  void initState() {
    super.initState();
    // Initialize with mock habits
    habits = Habit.getMockHabits();
  }

  void _toggleHabit(String id) {
    setState(() {
      final habit = habits.firstWhere((h) => h.id == id);
      habit.completed = !habit.completed;
    });
  }

  void _addHabit(String name, String duration, String emoji) {
    setState(() {
      final newHabit = Habit(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        emoji: emoji,
        color: 'blue',
        progress: duration.isNotEmpty ? '00:00/$duration' : 'Not completed',
      );
      habits.add(newHabit);
    });
  }

  void _showAddHabitDialog() {
    showDialog(
      context: context,
      builder: (context) => AddHabitDialog(
        onAdd: _addHabit,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final completedCount = habits.where((h) => h.completed).length;

    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      appBar: AppBar(
        backgroundColor: const Color(0xFF000000),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Today's Habits",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 4),
            Text(
              '$completedCount of ${habits.length} completed',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[400],
                  ),
            ),
          ],
        ),
        toolbarHeight: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: habits.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final habit = habits[index];
                  return HabitCard(
                    habit: habit,
                    onToggle: () => _toggleHabit(habit.id),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _showAddHabitDialog,
                icon: const Icon(Icons.add),
                label: const Text('Add New Habit'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFFFF9600),
                  side: BorderSide(
                    color: Colors.grey[700]!,
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
