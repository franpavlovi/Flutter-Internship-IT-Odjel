import 'package:flutter/material.dart';
import 'package:quizapp/widget/forma.dart';

class Validacija extends StatefulWidget {
  const Validacija({super.key});

  @override
  State<Validacija> createState() => _ValidacijaState();
}

class _ValidacijaState extends State<Validacija> {
  final _FormKey = GlobalKey<FormState>();

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
      body: Form(
        key: _FormKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Unesite tražene podatke',
                  style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500),
                ),
                Forma(hint: 'Email', icon: Icon(Icons.email)),
                Forma(hint: 'Telefonski broj', icon: Icon(Icons.phone)),
                Forma(
                  hint: 'Lozinka',
                  icon: Icon(Icons.password),
                  obscure: true,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_FormKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Forma je validna!')));
                    }
                  },
                  child: Text('Potvrdi'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*extension broj on int {
  bool ex() => (this % 2) == 0;
}

bool isEaven(int broj) {
  return (broj % 2) == 0;
}


final int broj = 2;

broj.ex()   ekstenzija 

isEaven(broj)  kao funkcija */