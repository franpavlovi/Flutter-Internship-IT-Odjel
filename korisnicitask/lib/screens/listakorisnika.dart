import 'package:flutter/material.dart';
import 'package:korisnicitask/models/korisnik.dart';
import 'package:korisnicitask/screens/detalji_korisnika.dart';

class Listakorisnika extends StatefulWidget {
  const Listakorisnika({super.key});

  static const routeName = '/listakorisnika';

  @override
  State<Listakorisnika> createState() => _ListakorisnikaState();
}

class _ListakorisnikaState extends State<Listakorisnika> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LISTA KORISNIKA", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: ListaKorisnika.getKorisnici().length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  elevation: 8,
                  child: ListTile(
                    leading: CircleAvatar(backgroundImage: ListaKorisnika.getKorisnici()[index].slika != null ? FileImage(ListaKorisnika.getKorisnici()[index].slika!) : const AssetImage('assets/images/no_image.png')),
                    title: Text(ListaKorisnika.getKorisnici()[index].ime + " " + ListaKorisnika.getKorisnici()[index].prezime),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetaljiKorisnika(korisnik: ListaKorisnika.getKorisnici()[index])));
                    },
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: const Text("test")),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[700],
                foregroundColor: Colors.white,
                shape: const StadiumBorder(),
                minimumSize: const Size(200, 50),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(Listakorisnika.routeName);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Dodajkorisnika()));
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add),
                  SizedBox(width: 8), // Razmak između ikone i teksta
                  Text(
                    "Dodaj korisnika",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
