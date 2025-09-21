import 'package:flutter/material.dart';
import 'package:btaskee_app/design_tokens/tokens.dart';

class AppSlidingButton extends StatefulWidget {
  final String label;
  final VoidCallback onComplete;

  const AppSlidingButton({
    super.key,
    required this.label,
    required this.onComplete,
  });

  @override
  State<AppSlidingButton> createState() => _AppSlidingButtonState();
}

class _AppSlidingButtonState extends State<AppSlidingButton>
    with SingleTickerProviderStateMixin {
  double _position = 0;
  late double _maxPosition;
  late AnimationController _resetController;
  late Animation<double> _resetAnimation;

  @override
  void initState() {
    super.initState();
    _resetController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _resetController.addListener(() {
      setState(() => _position = _resetAnimation.value);
    });
  }

  @override
  void dispose() {
    _resetController.dispose();
    super.dispose();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _position += details.delta.dx;
      if (_position < 0) _position = 0;
      if (_position > _maxPosition) _position = _maxPosition;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    if (_position >= _maxPosition * 0.9) {
      widget.onComplete();
      setState(() => _position = _maxPosition);
    } else {
      _resetAnimation =
          Tween<double>(begin: _position, end: 0).animate(_resetController);
      _resetController.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        _maxPosition = constraints.maxWidth - 60; // 60 = size của handle

        return Container(
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.surface,
            // borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.primary),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(widget.label, style: AppTextStyles.body),
              Positioned(
                left: _position,
                child: GestureDetector(
                  onPanUpdate: _onPanUpdate,
                  onPanEnd: _onPanEnd,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      // borderRadius: BorderRadius.circular(AppRadius.lg),
                    ),
                    child: const Icon(Icons.arrow_forward,
                        color: Colors.white, size: 28),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
