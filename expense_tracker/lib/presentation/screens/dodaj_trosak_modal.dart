import 'package:expense_tracker/domain/models/trosak.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DodajTrosakModal extends StatefulWidget {
  const DodajTrosakModal({super.key, required this.dodajTrosak});

  final Function(Trosak) dodajTrosak;

  @override
  State<DodajTrosakModal> createState() => _DodajTrosakModalState();
}

class _DodajTrosakModalState extends State<DodajTrosakModal> {
  KategorijaTroska? kategorijaTroska;
  DateTime? odabraniDatum;
  String ime = 'KATEGORIJA TROŠKA';

  final _nazivController = TextEditingController();
  final _iznosController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 150),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text('DODAJ TROŠAK', style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 28.0, color: Colors.black)),
            const SizedBox(height: 20),
            Flexible(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'NAZIV',
                  filled: true,
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
                maxLength: 20,
                controller: _nazivController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Unesite naziv';
                  }
                  return null;
                },
              ),
            ),
            Flexible(
              child: TextFormField(
                decoration: const InputDecoration(
                  prefixText: '€ ',
                  labelText: 'IZNOS',
                  filled: true,
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
                keyboardType: TextInputType.number,
                controller: _iznosController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Unesite iznos';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField(
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
                ),
                const SizedBox(width: 16),
                Column(
                  children: [
                    Text(
                      odabraniDatum == null ? 'DATUM' : formatirajDatum(d: odabraniDatum!),
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (odabraniDatum == null) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'GREŠKA',
                                style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              content: Text(
                                'Unesite datum.',
                                style: GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      } else if (kategorijaTroska == null) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'GREŠKA',
                                style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              content: Text(
                                'Odaberite kategoriju troška.',
                                style: GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        Trosak noviTrosak = Trosak(
                          naziv: _nazivController.text,
                          iznos: double.parse(_iznosController.text),
                          kategorijaTroska: kategorijaTroska!,
                          datum: odabraniDatum!,
                        );

                        widget.dodajTrosak(noviTrosak);

                        Navigator.of(context).pop();
                      }
                    }
                  },
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
