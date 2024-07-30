import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ito_task/feature/bloc/bloc/zadatak_bloc.dart';
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
          BlocBuilder<ZadatakBloc, ZadatakState>(builder: (context, state) {
            if (state is ZadatakInitial || state is ZadatakLoading) {
              context.read<ZadatakBloc>().add(GetZadaciEvent(zadatak: []));
              return const Center(child: CircularProgressIndicator());
            } else if (state is ZadatakLoaded) {
              return ListView.builder(
                itemCount: state.zadatakList.length,
                itemBuilder: (context, index) {
                  return ZadatakWidget(zadatak: state.zadatakList[index]);
                },
              );
            } else {
              return Container();
            }
          }),
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
