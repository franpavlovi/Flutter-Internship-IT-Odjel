class Pitanje {
  final String postavljenoPitanje;
  final String tocanOdgovor;
  final List<String> ponudjeniOdgovori;

  List<String> randomRaspored() {
    final izmjesanaLista = List.of(ponudjeniOdgovori);
    izmjesanaLista.shuffle();

    return izmjesanaLista;
  }

  const Pitanje({required this.postavljenoPitanje, required this.tocanOdgovor, required this.ponudjeniOdgovori});
}

const pitanja = [
  Pitanje(
    postavljenoPitanje: 'Kako se zove glavni grad Hrvatske',
    tocanOdgovor: 'Zagreb',
    ponudjeniOdgovori: ['Zagreb', 'Osijek', 'Split', 'Rijeka', 'Zadar'],
  ),
  Pitanje(
    postavljenoPitanje: 'Kako se zove glavni grad Belgije',
    tocanOdgovor: 'Bruxelles',
    ponudjeniOdgovori: ['Bratislava', 'Bruxelles', 'Amsterdam', 'Ljubljana', 'Antwerpen'],
  ),
  Pitanje(
    postavljenoPitanje: 'Kako se zove glavni grad Rumunjske',
    tocanOdgovor: 'Bukurešt',
    ponudjeniOdgovori: ['Cluj Napoca', 'Temišvar', 'Bukurešt', 'Vasloi', 'Ploše'],
  ),
  Pitanje(
    postavljenoPitanje: 'Kako se zove glavni grad Slovačke',
    tocanOdgovor: 'Bratislava',
    ponudjeniOdgovori: ['Bratislava', 'Bruxelles', 'Amsterdam', 'Ljubljana', 'Antwerpen'],
  ),
  Pitanje(
    postavljenoPitanje: 'Kako se zove glavni grad Namibije',
    tocanOdgovor: 'Windhoek',
    ponudjeniOdgovori: ['Johannesbourg', 'Windhoek', 'Amsterdam', 'Ljubljana', 'Antwerpen'],
  ),
];
