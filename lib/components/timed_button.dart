import 'dart:async';
import 'package:flutter/material.dart';
import 'package:btaskee_app/design_tokens/tokens.dart';
import 'button.dart';

class TimedButton extends StatefulWidget {
  final String label;
  final int seconds;
  final VoidCallback onPressed;


  const TimedButton({
    Key? key,
    required this.label,
    required this.seconds,
    required this.onPressed,
  }) : super(key: key);


  @override
  State<TimedButton> createState() => _TimedButtonState();
}


class _TimedButtonState extends State<TimedButton> {
  late int _remaining;
  Timer? _timer;


  @override
  void initState() {
    super.initState();
    _remaining = widget.seconds;
    _startTimer();
  }


  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remaining == 0) {
        timer.cancel();
      } else {
        setState(() => _remaining--);
      }
    });
  }


  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final isEnabled = _remaining == 0;
    return ElevatedButton(
      onPressed: isEnabled ? widget.onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnabled ? AppColors.primary : AppColors.disabled,
      ),
      child: Text(
        isEnabled ? widget.label : "${widget.label} (${_remaining}s)",
        style: AppTextStyles.body.copyWith(color: Colors.white),
      ),
    );
  }
}