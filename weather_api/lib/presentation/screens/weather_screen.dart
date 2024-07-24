import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_api/bloc/vrijeme_bloc.dart';
import 'package:weather_api/domain/data/consts.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({super.key});

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(157, 231, 195, 85),
        centerTitle: true,
        title: Text(
          'WEATHER API',
          style: GoogleFonts.lato(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color.fromARGB(3, 3, 232, 240), Colors.white], begin: Alignment.topRight, end: Alignment.bottomLeft),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 15,
            ),
            child: BlocBuilder<VrijemeBloc, VrijemeState>(
              builder: (context, state) {
                if (state is VrijemeInitial) {
                  return ElevatedButton(
                      onPressed: () => context.read<VrijemeBloc>().add(LoadVrijeme(imeGrada: 'London')),
                      child: Text(
                        'Get Weather',
                      ));
                }
                if (state is LoadingVrijeme) {
                  return CircularProgressIndicator();
                }

                if (state is LoadedVrijeme) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(state.podaciVrijeme.imeGrada),
                      Text(state.podaciVrijeme.vrijeme),
                      Text(state.podaciVrijeme.temperatura.toString()),
                      Text(state.podaciVrijeme.vlaznost.toString()),
                    ],
                  );
                }

                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
