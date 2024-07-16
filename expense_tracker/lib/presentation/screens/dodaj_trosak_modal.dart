import 'package:expense_tracker/domain/models/trosak.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DodajTrosakModal extends StatefulWidget {
  const DodajTrosakModal({super.key});

  @override
  State<DodajTrosakModal> createState() => _DodajTrosakModalState();
}

class _DodajTrosakModalState extends State<DodajTrosakModal> {
  KategorijaTroska? kategorijaTroska;
  DateTime? odabraniDatum;
  var datum = 'DATUM';
  String ime = 'KATEGORIJA TROŠKA';

  final _nazivController = TextEditingController();
  final _iznosController = TextEditingController();

  @override
  void dispose() {
    _nazivController.dispose();
    _iznosController.dispose();
    super.dispose();
  }

  String formatirajDatum({required DateTime d}) {
    final DateFormat formatter = DateFormat.yMd();
    return formatter.format(d);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Flexible(
        child: Column(
          children: [
            Text('DODAJ TROŠAK', style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 26.0, color: Colors.black)),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'NAZIV',
                filled: true,
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
              ),
              maxLength: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                prefixText: '€ ',
                labelText: 'IZNOS',
                filled: true,
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                DropdownButton(
                  items: KategorijaTroska.values
                      .map(
                        (kategorija) => DropdownMenuItem(
                          value: kategorija,
                          child: Text(
                            kategorija.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  hint: Text(
                    ime,
                    style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                  ),
                  value: kategorijaTroska,
                  onChanged: (value) {
                    setState(
                      () {
                        kategorijaTroska = value;
                      },
                    );
                  },
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      odabraniDatum == null ? datum : formatirajDatum(d: odabraniDatum!),
                      style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () async {
                        final DateTime? dateTime = await showDatePicker(
                          context: context,
                          firstDate: DateTime(2024),
                          initialDate: DateTime.now(),
                          lastDate: DateTime(2100),
                        );
                        if (dateTime != null) {
                          setState(() {
                            odabraniDatum = dateTime;
                          });
                        }
                      },
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 36, 33, 33), foregroundColor: Colors.white),
                  child: Text(
                    'DODAJ',
                    style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 36, 33, 33), foregroundColor: Colors.white),
                  child: Text(
                    'ODUSTANI',
                    style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
