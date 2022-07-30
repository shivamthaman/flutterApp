import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({Key? key, required this.icon, required this.enable})
      : super(key: key);
  final Icon icon;
  final bool enable;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: enable == true
            ? const LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                stops: [
                  0.1,
                  0.8,
                ],
                colors: [
                  Color(0xFFFFE79B),
                  Color(0xFFFFB81E),
                ],
              )
            : LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                stops: const [
                  0.1,
                  0.8,
                ],
                colors: [
                  Colors.grey[100]!,
                  Colors.grey[200]!,
                ],
              ),
      ),
      child: icon,
    );
  }
}
