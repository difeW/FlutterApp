import 'package:flutter/material.dart';

class CardButton extends StatefulWidget {
  const CardButton({Key? key, this.child, required this.onTap})
      : super(key: key);
  final Widget? child;
  final Function() onTap;

  @override
  State<CardButton> createState() => _CardButtonState();
}

class _CardButtonState extends State<CardButton> {
  ValueNotifier<bool> isDown = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => isDown.value = true,
      onTapUp: (_) => isDown.value = false,
      onTapCancel: () => isDown.value = false,
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: isDown,
        builder: (_, __) => AnimatedOpacity(
          duration: const Duration(milliseconds: 50),
          opacity: isDown.value ? 0.5 : 1,
          child: Card(
            margin: const EdgeInsets.all(8),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
