import 'package:bloc_learning/logic/cubit/brojac_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrugiScreen extends StatelessWidget {
  const DrugiScreen({super.key});

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
        listener: (context, state) {
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
                          BlocProvider.of<BrojacCubit>(context).smanji();
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      const Spacer(),
                      BlocBuilder<BrojacCubit, BrojacState>(
                        builder: (context, state) {
                          return Text(state.brojac.toString());
                        },
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<BrojacCubit>(context).povecaj();
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
