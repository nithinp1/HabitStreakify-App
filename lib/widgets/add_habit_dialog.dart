import 'package:flutter/material.dart';

class AddHabitDialog extends StatefulWidget {
  final Function(String name, String duration, String emoji) onAdd;

  const AddHabitDialog({
    super.key,
    required this.onAdd,
  });

  @override
  State<AddHabitDialog> createState() => _AddHabitDialogState();
}

class _AddHabitDialogState extends State<AddHabitDialog> {
  final _nameController = TextEditingController();
  final _durationController = TextEditingController();
  String _selectedEmoji = '✨';

  // List of emojis to choose from
  final List<String> _emojis = [
    '✨', '📚', '🦷', '📖', '☕', '🧘', '💧',
    '🏃', '💪', '🎯', '🎨', '🎵', '🍎', '😴',
    '📝', '💻', '🚶', '🧠', '❤️', '🌟', '🔥',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  void _handleAdd() {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a habit name'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    widget.onAdd(
      _nameController.text.trim(),
      _durationController.text.trim(),
      _selectedEmoji,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF212121),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add New Habit',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 24,
                  ),
            ),
            const SizedBox(height: 24),
            // Habit name input
            TextField(
              controller: _nameController,
              style: const TextStyle(color: Color(0xFFFBFAF5)),
              decoration: InputDecoration(
                labelText: 'Habit Name',
                labelStyle: TextStyle(color: Colors.grey[400]),
                hintText: 'e.g., Morning Exercise',
                hintStyle: TextStyle(color: Colors.grey[600]),
                filled: true,
                fillColor: const Color(0xFF000000),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[800]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xFFFF9600),
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Duration input
            TextField(
              controller: _durationController,
              style: const TextStyle(color: Color(0xFFFBFAF5)),
              decoration: InputDecoration(
                labelText: 'Duration (optional)',
                labelStyle: TextStyle(color: Colors.grey[400]),
                hintText: 'e.g., 30:00 or 1:00:00',
                hintStyle: TextStyle(color: Colors.grey[600]),
                filled: true,
                fillColor: const Color(0xFF000000),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[800]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xFFFF9600),
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Emoji picker
            Text(
              'Select Icon',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 12),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: const Color(0xFF000000),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[800]!),
              ),
              child: GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemCount: _emojis.length,
                itemBuilder: (context, index) {
                  final emoji = _emojis[index];
                  final isSelected = emoji == _selectedEmoji;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedEmoji = emoji;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFFF9600).withOpacity(0.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFFFF9600)
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          emoji,
                          style: const TextStyle(fontSize: 28),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: _handleAdd,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF9600),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Add Habit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
