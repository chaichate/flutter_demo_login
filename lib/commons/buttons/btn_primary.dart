import 'package:flutter/material.dart';

class BtnPrimary extends StatelessWidget {
  final VoidCallback? onPressed;

  final String? title;

  final Size? size;

  final Widget? child;
  final EdgeInsets? padding;

  const BtnPrimary(
      {Key? key,
      this.title,
      this.size,
      this.child,
      this.onPressed,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(5.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(size?.width ?? double.infinity, 50),
          backgroundColor: onPressed != null
              ? Colors.green
              : Colors.grey, // Here's the change
          // backgroundColor : Styles.foregroundPrimary,
          maximumSize: Size.infinite,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
        onPressed: onPressed,
        child: child ??
            Text(
              title!,
              textScaleFactor: 1.0,
              maxLines: 1,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
      ),
    );
  }
}
