import 'package:flutter/material.dart';
import 'package:flutterosnove/zarolaj_kockicu.dart';

class Slike extends StatelessWidget {
  const Slike({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: ZarolajKockicu(),
      ),
    );
  }
}
