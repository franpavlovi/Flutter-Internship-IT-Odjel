import 'package:flutter/material.dart';
import 'package:meals_app/domain/models/hrana.dart';

class HranaKategorijeScreen extends StatelessWidget {
  const HranaKategorijeScreen({super.key, required this.hrana, required this.kategorija});

  final List<Hrana> hrana;
  final String kategorija;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Hrana kategorije'),
    );
  }
}
