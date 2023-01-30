import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SidePanelButton extends StatelessWidget {
  const SidePanelButton({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.splashColor,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  final Widget icon;
  final Color iconColor;
  final Color splashColor;
  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 45,
      child: TextButton.icon(
        onPressed: onPressed,
        icon: Container(
          width: 32,
          height: 32,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              color: iconColor, borderRadius: BorderRadius.circular(8)),
          child: icon,
        ),
        label: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
        style: TextButton.styleFrom(
          alignment: Alignment.centerLeft,
          foregroundColor: splashColor,
        ),
      ),
    );
  }
}
