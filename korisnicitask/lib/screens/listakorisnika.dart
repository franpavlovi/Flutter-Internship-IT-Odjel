import 'package:flutter/material.dart';
import 'package:korisnicitask/screens/dodajkorisnika.dart';

class Listakorisnika extends StatelessWidget {
  const Listakorisnika({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista korisnika"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Lista korisnika not avalaible now"),
              SizedBox(
                height: 600,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[700],
                  foregroundColor: Colors.white,
                  shape: StadiumBorder(),
                  minimumSize: Size(200, 50),
                ),
                onPressed: () {},
                child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dodajkorisnika()),
                    );
                  },
                ),
              ),
              Text(
                "DODAJ NOVOG KORISNIKA",
                style: TextStyle(fontSize: 15, color: Colors.grey[700], fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
