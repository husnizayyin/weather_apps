import 'package:flutter/material.dart';
import 'package:weather_apps/app/core/value/colors.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  final void Function()? onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: baseColor,
      ),
      child: Text(
        buttonText,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
