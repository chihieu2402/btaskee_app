import 'package:flutter/material.dart';
import 'package:btaskee_app/design_tokens/tokens.dart';

class AppTimePicker extends StatefulWidget {
  final TimeOfDay? initialTime;
  final ValueChanged<TimeOfDay> onChanged;

  const AppTimePicker({
    super.key,
    this.initialTime,
    required this.onChanged,
  });

  @override
  State<AppTimePicker> createState() => _AppTimePickerState();
}

class _AppTimePickerState extends State<AppTimePicker> {
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedTime = widget.initialTime ?? TimeOfDay.now();
  }

  Future<void> _pickTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() => _selectedTime = picked);
      widget.onChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final timeText = _selectedTime != null
        ? _selectedTime!.format(context)
        : "Select time";

    return GestureDetector(
      onTap: () => _pickTime(context),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(AppRadius.md),
          color: AppColors.surface,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(timeText, style: AppTextStyles.body),
            const Icon(Icons.access_time, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}
