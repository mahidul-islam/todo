import 'package:flutter/material.dart';

class BarButton extends StatelessWidget {
  const BarButton({
    super.key,
    this.title = '',
    required this.onPressed,
    this.buttonColor,
    this.textColor = Colors.white,
    this.iconBorderColor,
    this.height = 40,
    this.radius = 8,
    this.icon,
    this.leftIcon,
    this.rightIcon,
    this.borderside = BorderSide.none,
    this.isSpacingNeeded = false,
    this.padding,
    this.textStyle,
  });

  factory BarButton.primary({
    required final Function()? onPressed,
    required final String title,
    final Color? buttonColor,
  }) {
    return BarButton(
      title: title,
      onPressed: onPressed,
      buttonColor: buttonColor ?? Colors.blue,
    );
  }

  factory BarButton.secondary({
    required final Function()? onPressed,
    required final String title,
    final Color? buttonColor,
  }) {
    return BarButton(
      title: title,
      onPressed: onPressed,
      textColor: Colors.blue,
      buttonColor: buttonColor ?? Colors.blue.withOpacity(0.1),
    );
  }

  final VoidCallback? onPressed;
  final Color? buttonColor;
  final Color textColor;
  final Color? iconBorderColor;
  final double height;
  final double radius;
  final Widget? icon;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final String title;
  final BorderSide borderside;
  final bool isSpacingNeeded;
  final EdgeInsets? padding;
  final TextStyle? textStyle;

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: height,
      child: MaterialButton(
        enableFeedback: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: borderside,
        ),
        color: onPressed == null
            ? Colors.white24
            : buttonColor ?? Colors.blueAccent,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        elevation: 0,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
        onPressed: onPressed ?? () {},
        mouseCursor:
            onPressed == null ? MouseCursor.defer : MouseCursor.uncontrolled,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (title.isNotEmpty)
              Text(
                title,
                style:
                    textStyle ?? const TextStyle(fontWeight: FontWeight.w600),
              ),
          ],
        ),
      ),
    );
  }
}
