import 'package:bloc_learning/cubit/brojac_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BrojacCubit(),
      child: MaterialApp(
        title: 'BLoC Learning',
        home: BrojacScreen(),
      ),
    );
  }
}

class BrojacScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BLoC Learning',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocListener<BrojacCubit, BrojacState>(
        //omotavamo sve child widgete sa BlocListenerom
        listener: (context, state) {
          //zadajemo sta osluškuje
          if (state.inkrementiran == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 1),
                content: Text('Brojac je povecan!'),
              ),
            );
          } else if (state.inkrementiran == false) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(microseconds: 300),
                content: Text('Brojac je smanjen!'),
              ),
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<BrojacCubit>(context).smanji(); // povezivanje funkcije i iconbuttona
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      const Spacer(),
                      BlocBuilder<BrojacCubit, BrojacState>(
                        //nacin kako se povezuje data i UI (BlocBuilder)
                        builder: (context, state) {
                          return Text(state.brojac.toString());
                        },
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<BrojacCubit>(context).povecaj(); // povezivanje funkcije i iconbuttona
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
