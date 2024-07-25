import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ito_task/feature/bloc/bloc/zadatak_bloc.dart';
import 'package:ito_task/feature/domain/models/zadatak.dart';

class Dodajzadatak extends StatefulWidget {
  const Dodajzadatak({super.key});

  @override
  State<Dodajzadatak> createState() => _DodajzadatakState();
}

class _DodajzadatakState extends State<Dodajzadatak> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _imeZadatkaController = TextEditingController();
  final TextEditingController _opisZadatkaController = TextEditingController();

  @override
  void dispose() {
    _imeZadatkaController.dispose();
    _opisZadatkaController.dispose();
    super.dispose();
  }

  void dodajZadatak() {
    if (_formKey.currentState!.validate()) {
      context.read<ZadatakBloc>().add(
            CreateZadatakEvent(
              zadatak: Zadatak(
                imeZadatka: _imeZadatkaController.text,
                opisZadatka: _opisZadatkaController.text,
                isActive: true,
              ),
            ),
          );
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Unesite naziv zadatka'),
              maxLength: 20,
              controller: _imeZadatkaController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Molimo unesite naziv zadatka';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Unesite opis zadatka'),
              maxLength: 70,
              controller: _opisZadatkaController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Molimo unesite opis zadatka';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: dodajZadatak,
                child: Text(
                  'DODAJ',
                  style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(153, 4, 194, 115),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
