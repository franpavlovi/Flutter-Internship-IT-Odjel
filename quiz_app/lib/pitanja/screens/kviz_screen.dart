import 'package:flutter/material.dart';
import 'package:quiz_app/pitanja/domain/models/pitanje.dart';
import 'package:quiz_app/pitanja/widgets/odgovor_button.dart';

class KvizScreen extends StatefulWidget {
  const KvizScreen({super.key});

  @override
  State<KvizScreen> createState() => _KvizScreenState();
}

class _KvizScreenState extends State<KvizScreen> {
  void odgovorNaPitanje() {
    setState(() {
      if (pitanjeIndex < pitanja.length - 1) {
        pitanjeIndex++;
      } else {
        pitanjeIndex = 0;
      }
    });
  }

  var pitanjeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final trenutnoPitanje = pitanja[pitanjeIndex];

    return Card(
      color: Color.fromARGB(255, 65, 4, 100),
      elevation: 50,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: Colors.white,
          width: 5,
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                trenutnoPitanje.postavljenoPitanje,
                style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              ...trenutnoPitanje.randomRaspored().map((odgovor) {
                return OdgovorButton(odgovor: odgovor, naKlik: odgovorNaPitanje);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
