import 'package:flutter/material.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/resources/palette_colors.dart';

class Check extends StatefulWidget {
  final bool show;

  const Check({
    Key? key,
    required this.show,
  }) : super(key: key);

  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOutCirc),
    );

    if (widget.show) {
      Future.delayed(const Duration(seconds: 1), () {
        _animationController.forward();
      });
    }
  }

  @override
  void dispose() {
    _animationController.reset;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.paddingMedium),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: widget.show ? PaletteColors.done : PaletteColors.pending,
              borderRadius: BorderRadius.circular(Dimens.radiusLarge),
            ),
            child: Icon(
              Icons.check,
              // progress: _animation,
              color: widget.show ? Colors.white : Colors.transparent,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
