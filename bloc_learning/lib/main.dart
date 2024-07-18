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
      //providamo svim child widgetima
      create: (context) => BrojacCubit(),
      child: MaterialApp(
        title: 'BLoC Learning',
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'BLoC Learning',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: const Row(children: [
                      Icon(Icons.remove),
                      Spacer(),
                      Text('BROJ'),
                      Spacer(),
                      Icon(Icons.add),
                    ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
