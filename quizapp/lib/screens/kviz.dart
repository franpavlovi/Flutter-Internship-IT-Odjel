import 'package:flutter/material.dart';
import 'package:quizapp/screens/validacija.dart';

class Kviz extends StatefulWidget {
  const Kviz({super.key});

  @override
  State<Kviz> createState() => _KvizState();
}

class _KvizState extends State<Kviz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        shadowColor: const Color.fromARGB(193, 3, 3, 3),
        title: const Text(
          'Quizz App',
          style: TextStyle(
            color: Colors.green,
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontFamily: 'Helvetica',
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Pitanje 1 glasi:'),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: null,
              child: Text('Pitanje 1'),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text('Pitanje 2'),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text('Pitanje 3'),
            ),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Validacija(),
                  ),
                );
              },
              child: Text('Kraj'),
            ),
          ],
        ),
      ),
    );
  }
}
