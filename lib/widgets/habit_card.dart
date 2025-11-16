import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import '../models/habit.dart';

class HabitCard extends StatefulWidget {
  final Habit habit;
  final VoidCallback onToggle;

  const HabitCard({
    super.key,
    required this.habit,
    required this.onToggle,
  });

  @override
  State<HabitCard> createState() => _HabitCardState();
}

class _HabitCardState extends State<HabitCard> {
  final GlobalKey<SlideActionState> _slideKey = GlobalKey();

  Color _getColorFromString(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'green':
        return const Color(0xFF34C759);
      case 'yellow':
        return const Color(0xFFFFD60A);
      case 'purple':
        return Colors.purple;
      case 'red':
        return Colors.red;
      case 'pink':
        return Colors.pink;
      case 'blue':
        return Colors.blue;
      default:
        return const Color(0xFFFF9600);
    }
  }

  @override
  Widget build(BuildContext context) {
    // If already completed, show completed state without slide action
    if (widget.habit.completed) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF34C759).withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFF34C759),
            width: 2,
          ),
        ),
        child: Row(
          children: [
            // Emoji icon
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: _getColorFromString(widget.habit.color).withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  widget.habit.emoji,
                  style: const TextStyle(fontSize: 28),
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Habit details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.habit.name,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          decoration: TextDecoration.lineThrough,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.habit.progress,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[400],
                        ),
                  ),
                ],
              ),
            ),
            // Checkmark
            Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                color: Color(0xFF34C759),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      );
    }

    // Not completed - show slide to complete
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF212121),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SlideAction(
        key: _slideKey,
        height: 90,
        sliderButtonIconSize: 20,
        sliderButtonIconPadding: 12,
        borderRadius: 12,
        elevation: 0,
        innerColor: const Color(0xFFFF9600),
        outerColor: const Color(0xFF212121),
        sliderButtonIcon: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        text: '',
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        submittedIcon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
        onSubmit: () {
          Future.delayed(const Duration(milliseconds: 500), () {
            widget.onToggle();
          });
          return null;
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              // Emoji icon
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: _getColorFromString(widget.habit.color).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    widget.habit.emoji,
                    style: const TextStyle(fontSize: 28),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Habit details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.habit.name,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.habit.progress,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[400],
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
