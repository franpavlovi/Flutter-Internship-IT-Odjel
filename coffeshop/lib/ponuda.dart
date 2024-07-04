import 'package:coffeshop/kava.dart';
import 'package:coffeshop/kavakartica.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Ponuda extends StatefulWidget {
  const Ponuda({super.key});

  @override
  State<Ponuda> createState() => _PonudaState();
}

class _PonudaState extends State<Ponuda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        title: const Text(
          'Coffe Shop',
          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 88, 51, 38),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/zrnakave.jpg',
          ),
          const SizedBox(
            height: 50,
          ),
          Flexible(
            child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(20),
                child: GridView.count(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10, children: [
                  Kavakartica(kava: Kava(ime: 'Robusto', cijena: 10.0, slika: 'assets/images/kava1.jpg')),
                  Kavakartica(kava: Kava(ime: 'Premium', cijena: 20.0, slika: 'assets/images/kava2.jpg')),
                  Kavakartica(kava: Kava(ime: 'Arabesca', cijena: 10.0, slika: 'assets/images/kava3.jpg')),
                  Kavakartica(kava: Kava(ime: 'Moka', cijena: 15.0, slika: 'assets/images/kava1.jpg')),
                  Kavakartica(kava: Kava(ime: 'Eskpresko', cijena: 10.0, slika: 'assets/images/kava2.jpg')),
                  Kavakartica(kava: Kava(ime: 'Kapucino', cijena: 20.0, slika: 'assets/images/kava3.jpg')),
                  Kavakartica(kava: Kava(ime: 'Crna', cijena: 10.0, slika: 'assets/images/kava1.jpg')),
                  Kavakartica(
                    kava: Kava(ime: 'Bijela', cijena: 15.0, slika: 'assets/images/kava2.jpg'),
                  ),
                ])),
          ),
        ],
      ),
    );
  }
}
