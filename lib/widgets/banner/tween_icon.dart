import 'package:flutter/material.dart';

///Retorna um ícone animado com o efeito de boucing a partir de um ícone qualquer
class TweenIcon extends StatefulWidget {
  ///Ícone que será animado
  final IconData icon;

  ///A cor do ícone
  final Color iconColor;

  const TweenIcon({required this.icon, required this.iconColor, super.key});

  @override
  State<TweenIcon> createState() => _TweenIconState();
}

class _TweenIconState extends State<TweenIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: -0.75, end: 0.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInCirc,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(
              0.0,
              -8.0 * _animation.value,
            ),
            child: child,
          );
        },
        child: Icon(widget.icon, color: widget.iconColor));
  }

  @override
  dispose() {
    _controller
        .dispose(); //Necessário para não ocorrer => Flutter: Ticker must be disposed before calling super.dispose()
    super.dispose();
  }
}
