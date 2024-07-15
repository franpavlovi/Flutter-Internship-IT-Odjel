import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class Trosak {
  final String id;
  final String naziv;
  final double iznos;
  final DateTime datum;
  KategorijaTroska kategorijaTroska;

  Trosak({required this.naziv, required this.iznos, required this.datum, required this.kategorijaTroska}) : id = uuid.v4();
}

enum KategorijaTroska { hrana, zabava, racuni, transport, luksuz, ostalo }

final ikoneKategorijaTroska = {
  KategorijaTroska.hrana: Icons.fastfood,
  KategorijaTroska.zabava: Icons.party_mode,
  KategorijaTroska.racuni: Icons.account_balance,
  KategorijaTroska.transport: Icons.directions_car,
  KategorijaTroska.luksuz: Icons.diamond,
  KategorijaTroska.ostalo: Icons.drag_indicator_sharp,
};
