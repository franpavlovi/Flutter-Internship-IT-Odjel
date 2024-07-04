import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterosnove/kartica.dart';
import 'package:flutterosnove/slike.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('OSNOVE FLUTTERA')),
        ),
        backgroundColor: Colors.green,
        body: Column(
          children: [
            Expanded(
              child: GridView(
                padding: const EdgeInsets.all(
                  10,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2 / 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                children: const [
                  Kartica(
                    color: Colors.white,
                    title: 'TETSTS',
                    icon: Icons.ac_unit,
                    height: 200,
                    width: 200,
                  ),
                  Kartica(
                    color: Colors.white,
                    title: 'TAAAA',
                    icon: Icons.account_balance,
                    height: 200,
                    width: 200,
                  ),
                  Kartica(
                    color: Colors.white,
                    title: 'TETSTS',
                    icon: Icons.add_call,
                    height: 200,
                    width: 200,
                  ),
                  Kartica(
                    color: Colors.white,
                    title: 'TETSTS',
                    icon: Icons.abc_outlined,
                    height: 200,
                    width: 200,
                  ),
                ],
              ),
            ),
            const Slike(),
          ],
        ),
      ),
    );
  }
}
