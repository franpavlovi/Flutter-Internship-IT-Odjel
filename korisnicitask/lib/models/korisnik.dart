import 'dart:io';

class Korisnik {
  String ime;
  String prezime;
  String email;
  String telefon;
  String lozinka;
  String potvrda;
  File? slika;

  Korisnik(this.id, this.ime, this.prezime, this.email, this.telefon, this.lozinka, this.potvrda, this.slika);

  String id;
}

class ListaKorisnika {
  static final List<Korisnik> _korisnici = [];

  static List<Korisnik> getKorisnici() {
    return _korisnici;
  }

  static void dodajKorisnika(Korisnik korisnik) {
    _korisnici.add(korisnik);
  }

  static void ukloniKorisnika(String id) {
    _korisnici.removeWhere((korisnik) => korisnik.id == id);
  }

  static Korisnik? nadjiKorisnika(String id) {
    try {
      return _korisnici.firstWhere((korisnik) => korisnik.id == id);
    } catch (e) {
      return null;
    }
  }
}
