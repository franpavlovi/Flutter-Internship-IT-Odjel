import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ito_task/presentation/widgets/DodajZadatak.dart';
import 'package:ito_task/presentation/widgets/ZadatakWidget.dart';

class ListazadatakaScreen extends StatefulWidget {
  const ListazadatakaScreen({super.key});

  @override
  State<ListazadatakaScreen> createState() => _ListazadatakaScreenState();
}

class _ListazadatakaScreenState extends State<ListazadatakaScreen> {
  void dodajZadatak() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return const Dodajzadatak();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 163, 160, 160),
        title: Text(
          "TASK MANAGER",
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Zadatakwidget(),
            Zadatakwidget(),
            Zadatakwidget(),
            Zadatakwidget(),
            Zadatakwidget(),
            Zadatakwidget(),
            Zadatakwidget(),
            Zadatakwidget(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 163, 160, 160),
                foregroundColor: Colors.white,
              ),
              onPressed: dodajZadatak,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'DODAJ ZADATAK',
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(Icons.add),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
