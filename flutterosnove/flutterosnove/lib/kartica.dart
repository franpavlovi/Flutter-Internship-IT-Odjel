import 'package:flutter/material.dart';

class Kartica extends StatelessWidget {
  const Kartica({
    super.key,
    required this.color,
    required this.title,
    required this.icon,
    required this.height,
    required this.width,
  });

  final Color color;
  final String title;
  final IconData icon;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: color,
      ),
      height: height,
      width: width,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(icon),
        SizedBox(
          height: 10,
        ),
        Text(title),
      ]),
    );
  }
}
