import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ito_task/feature/bloc/bloc/zadatak_bloc.dart';
import 'package:ito_task/feature/domain/models/zadatak.dart';

class ZadatakWidget extends StatefulWidget {
  const ZadatakWidget({super.key, required this.zadatak});

  final Zadatak zadatak;

  @override
  State<ZadatakWidget> createState() => _ZadatakWidgetState();
}

class _ZadatakWidgetState extends State<ZadatakWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 8,
      ),
      child: Card(
        color: widget.zadatak.isActive ? const Color.fromARGB(255, 163, 160, 160) : const Color.fromARGB(255, 52, 53, 53),
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.zadatak.imeZadatka,
                style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Divider(
                thickness: 2,
                color: Colors.white70,
              ),
              Text(
                widget.zadatak.opisZadatka,
                style: GoogleFonts.lato(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<ZadatakBloc>().add(UpdateZadatakEvent(zadatak: widget.zadatak));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.zadatak.isActive ? const Color.fromARGB(153, 4, 194, 115) : const Color.fromARGB(83, 4, 194, 115),
                    ),
                    child: Text(
                      widget.zadatak.isActive ? 'URAĐEN' : 'VRATI',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ZadatakBloc>().add(DeleteZadatak(zadatak: widget.zadatak));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.zadatak.isActive ? Colors.red : const Color.fromARGB(132, 244, 67, 54),
                    ),
                    child: const Text(
                      'IZBRIŠI',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
