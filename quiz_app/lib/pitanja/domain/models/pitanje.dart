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
    postavljenoPitanje: 'Kako se zove glavni grad Hrvatske?',
    tocanOdgovor: 'Zagreb',
    ponudjeniOdgovori: ['Zagreb', 'Osijek', 'Split', 'Rijeka', 'Zadar'],
  ),
  Pitanje(
    postavljenoPitanje: 'Kako se zove glavni grad Belgije?',
    tocanOdgovor: 'Bruxelles',
    ponudjeniOdgovori: ['Bratislava', 'Bruxelles', 'Amsterdam', 'Ljubljana', 'Antwerpen'],
  ),
  Pitanje(
    postavljenoPitanje: 'Kako se zove glavni grad Rumunjske?',
    tocanOdgovor: 'Bukurešt',
    ponudjeniOdgovori: ['Cluj Napoca', 'Temišvar', 'Bukurešt', 'Vasloi', 'Ploše'],
  ),
  Pitanje(
    postavljenoPitanje: 'Kako se zove glavni grad Slovačke?',
    tocanOdgovor: 'Bratislava',
    ponudjeniOdgovori: ['Bratislava', 'Bruxelles', 'Amsterdam', 'Ljubljana', 'Antwerpen'],
  ),
  Pitanje(
    postavljenoPitanje: 'Kako se zove glavni grad Namibije?',
    tocanOdgovor: 'Windhoek',
    ponudjeniOdgovori: ['Johannesbourg', 'Windhoek', 'Amsterdam', 'Ljubljana', 'Antwerpen'],
  ),
  Pitanje(
    postavljenoPitanje: 'Koji je glavni grad Francuske?',
    tocanOdgovor: 'Pariz',
    ponudjeniOdgovori: ['Pariz', 'Marseille', 'Lyon', 'Toulouse', 'Nice'],
  ),
  Pitanje(
    postavljenoPitanje: 'Koji je glavni grad Japana?',
    tocanOdgovor: 'Tokio',
    ponudjeniOdgovori: ['Tokio', 'Osaka', 'Kyoto', 'Yokohama', 'Nagoya'],
  ),
  Pitanje(
    postavljenoPitanje: 'Koji je glavni grad Brazila?',
    tocanOdgovor: 'Brasilia',
    ponudjeniOdgovori: ['Brasilia', 'Rio de Janeiro', 'São Paulo', 'Salvador', 'Belo Horizonte'],
  ),
  Pitanje(
    postavljenoPitanje: 'Koji je glavni grad Kanade?',
    tocanOdgovor: 'Ottawa',
    ponudjeniOdgovori: ['Ottawa', 'Toronto', 'Montreal', 'Vancouver', 'Calgary'],
  ),
  Pitanje(
    postavljenoPitanje: 'Koji je glavni grad Australije?',
    tocanOdgovor: 'Canberra',
    ponudjeniOdgovori: ['Canberra', 'Sydney', 'Melbourne', 'Brisbane', 'Perth'],
  ),
  Pitanje(
    postavljenoPitanje: 'Koji je glavni grad Indije?',
    tocanOdgovor: 'New Delhi',
    ponudjeniOdgovori: ['New Delhi', 'Mumbai', 'Kolkata', 'Chennai', 'Bangalore'],
  ),
  Pitanje(
    postavljenoPitanje: 'Koji je glavni grad Njemačke?',
    tocanOdgovor: 'Berlin',
    ponudjeniOdgovori: ['Berlin', 'Hamburg', 'München', 'Köln', 'Frankfurt'],
  ),
  Pitanje(
    postavljenoPitanje: 'Koji je glavni grad Rusije?',
    tocanOdgovor: 'Moskva',
    ponudjeniOdgovori: ['Moskva', 'Sankt-Peterburg', 'Novosibirsk', 'Ekaterinburg', 'Nizhniy Novgorod'],
  ),
  Pitanje(
    postavljenoPitanje: 'Koji je glavni grad Južne Afrike?',
    tocanOdgovor: 'Pretoria',
    ponudjeniOdgovori: ['Pretoria', 'Cape Town', 'Johannesburg', 'Durban', 'Bloemfontein'],
  ),
];
