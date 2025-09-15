import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teplo_fest_humo/presentation/widget/resizable_widget/icon_widget_cubit.dart';

class ResizableWidget extends StatelessWidget {
  final Widget child;
  final String? presentIn2letter;
  final Function()? onTap;

  const ResizableWidget({
    required this.child,
    this.presentIn2letter,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => IconCubit(),
      child: BlocBuilder<IconCubit, bool>(
        builder: (context, isPressed) {
          return GestureDetector(
            onTapDown: (_) => context.read<IconCubit>().press(),
            onTapUp: (_) => context.read<IconCubit>().release(),
            onTapCancel: () => context.read<IconCubit>().release(),
            onTap: () => onTap != null ? onTap!() : null,
            child: AnimatedScale(
              duration: const Duration(milliseconds: 100),
              scale:
                  isPressed ? double.parse("0.${presentIn2letter ?? 9}") : 1.0,
              child: child,
            ),
          );
        },
      ),
    );
  }
}
