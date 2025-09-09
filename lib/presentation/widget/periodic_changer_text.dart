import 'package:flutter/material.dart';
import 'dart:async';

class PeriodicChangerText extends StatefulWidget {
  final List<String> texts;
  final Duration? duration;
  final TextStyle? style;

  const PeriodicChangerText({
    super.key,
    required this.texts,
    this.duration,
    this.style,
  });

  @override
  State<PeriodicChangerText> createState() => _PeriodicChangerTextState();
}

class _PeriodicChangerTextState extends State<PeriodicChangerText> with SingleTickerProviderStateMixin {
  late Timer _timer;
  int _currentIndex = 0;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _startTimer();
  }

  void _startTimer() {
    final interval = widget.duration ?? const Duration(seconds: 2);
    _timer = Timer.periodic(interval, (timer) {
      if (widget.texts.isNotEmpty) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % widget.texts.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.texts.isEmpty) {
      return const SizedBox.shrink();
    }

    final currentText = widget.texts[_currentIndex];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: Text(
        currentText,
        key: ValueKey<String>(currentText),
        style: widget.style ?? const TextStyle(fontSize: 24),
      ),
    );
  }
}
