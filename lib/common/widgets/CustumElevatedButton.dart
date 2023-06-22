import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final double? weight;
  final VoidCallback onPress;
  final String text;
  const CustomElevatedButton({
    super.key,
    this.weight,
    required this.onPress,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: weight ?? MediaQuery.sizeOf(context).width - 100,
      child: ElevatedButton(
        onPressed: onPress,
        child: Text(
          text,
        ),
        style: ElevatedButton.styleFrom(),
      ),
    );
  }
}
