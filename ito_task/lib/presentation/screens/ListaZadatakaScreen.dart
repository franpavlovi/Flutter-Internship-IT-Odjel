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
  void dodajZadatakModal() {
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
      body: Stack(
        children: [
          const SingleChildScrollView(
            child: const Column(
              children: [
                Zadatakwidget(),
                Zadatakwidget(),
                Zadatakwidget(),
                Zadatakwidget(),
                Zadatakwidget(),
                Zadatakwidget(),
                Zadatakwidget(),
                Zadatakwidget(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              child: FloatingActionButton(
                backgroundColor: const Color.fromARGB(218, 197, 194, 194),
                foregroundColor: Colors.white,
                onPressed: dodajZadatakModal,
                child: const Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ListazadatakaScreen(),
  ));
}
