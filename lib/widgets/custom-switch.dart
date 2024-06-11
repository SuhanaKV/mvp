import 'package:flutter/material.dart';
import 'package:mvp/utils/colors.dart';
import 'package:mvp/utils/dimensions.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({super.key, required this.value, required this.onChanged});

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Alignment> _circleAnimation;
  bool isFirstCircleVisible = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _circleAnimation = AlignmentTween(
      begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
      end: widget.value ? Alignment.centerLeft : Alignment.centerRight,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

   @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_animationController.isCompleted) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
        widget.onChanged(!widget.value);
        setState(() {
          isFirstCircleVisible = !isFirstCircleVisible;
        });
      },
      child: Container(
        width: Dimensions.width60,
        height: Dimensions.height30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.grey4,
        ),
        child: Stack(
          children: [
            Align(
              alignment: _circleAnimation.value,
              child: Container(
                  alignment: widget.value
                      ? ((Directionality.of(context) == TextDirection.rtl)
                          ? Alignment.centerLeft
                          : Alignment.centerRight)
                      : ((Directionality.of(context) == TextDirection.rtl)
                          ? Alignment.centerRight
                          : Alignment.centerLeft),
                          child: Container(
                    width: Dimensions.width20,
                    height: Dimensions.width20,
                    decoration: BoxDecoration(
                      color: widget.value ? AppColors.darkBlack :AppColors.white,
                      shape: BoxShape.circle,
                      boxShadow: const [BoxShadow(blurRadius: 20, spreadRadius: 0, offset: Offset(0,0))]
                    ),
                  )
                ),
              
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}