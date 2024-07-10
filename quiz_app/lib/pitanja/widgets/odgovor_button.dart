import 'package:flutter/material.dart';
import 'package:quiz_app/pitanja/domain/models/pitanje.dart';

class OdgovorButton extends StatelessWidget {
  OdgovorButton({super.key, required this.onPressed, required this.pitanje});

  final Function? onPressed;
  final Pitanje pitanje;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
      onPressed: () {},
      child: Text('asasasa'),
    );
  }
}
