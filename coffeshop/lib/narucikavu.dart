import 'package:coffeshop/kava.dart';
import 'package:flutter/material.dart';

class Narucikavu extends StatefulWidget {
  const Narucikavu({super.key, required this.kava});

  final Kava kava;

  @override
  State<Narucikavu> createState() => _NarucikavuState();
}

class _NarucikavuState extends State<Narucikavu> {
  var kolicina = 1;

  void showSuccessDialog(BuildContext context, Kava kava) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Uspjesno ste narucili kavu ${kava.ime}'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Ukupna cijena: ${kolicina * widget.kava.cijena} ',
                    style: const TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                    child: const Text('Zatvori'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

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
      body: Center(
        child: Column(
          children: [
            Image.asset(widget.kava.slika, height: 300, width: 300),
            IconButton(
              onPressed: () {
                setState(() {
                  widget.kava.fav = !widget.kava.fav;
                });
              },
              icon: Icon(widget.kava.fav ? Icons.heart_broken : Icons.heart_broken_outlined),
            ),
            const SizedBox(
              height: 100,
            ),
            Text(widget.kava.ime, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            Text(widget.kava.cijena.toString() + ' EUR', style: const TextStyle(color: Colors.white)),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120.0),
              child: SizedBox(
                child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (kolicina > 0) {
                                kolicina--;
                              }
                            });
                          },
                          icon: const Icon(Icons.remove),
                        ),
                        Text(kolicina.toString()),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              kolicina++;
                            });
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    )),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                showSuccessDialog(context, widget.kava);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              child: const Text(
                'NARUČI',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
