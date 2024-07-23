class Hrana {
  final String naziv;
  final List<String> sastojci;
  final List<String> koraci;
  final String urlSlike;
  final String kategorija;
  final String zahtjevnost;
  final String pristupacnost;

  Hrana({required this.naziv, required this.sastojci, required this.koraci, required this.urlSlike, required this.kategorija, required this.zahtjevnost, required this.pristupacnost});
}

enum Pristupacnost {
  jefitno,
  sredina,
  skupo,
  luksuzno,
}

enum Zahtjevnost {
  lako,
  srednje,
  tesko,
}
