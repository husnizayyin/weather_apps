import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WhiteText extends StatelessWidget {
  const WhiteText({
    Key? key,
    required this.texting,
  }) : super(key: key);

  final String texting;

  @override
  Widget build(BuildContext context) {
    return Text(
      texting,
      style: const TextStyle(color: Colors.white),
    );
  }
}
