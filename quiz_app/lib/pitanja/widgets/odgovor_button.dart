import 'package:flutter/material.dart';

class OdgovorButton extends StatelessWidget {
  const OdgovorButton({super.key, required this.odgovor, required this.naKlik});

  final String odgovor;
  final void Function()? naKlik;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: naKlik,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
      ),
      child: Text(
        odgovor,
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 20,
        ),
      ),
    );
  }
}
