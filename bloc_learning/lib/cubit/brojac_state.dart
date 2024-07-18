part of 'brojac_cubit.dart';

final class BrojacState {
  //ova klasa ce služiti kao blueprint za sve moguće stateove koji će biti emitirani

  int brojac;
  bool? inkrementiran; //dodajemo ovo polje kako bi mogli implementirati BlocListener (parametar na koji ce on slusati i raditi sta mu se zada)

  BrojacState({required this.brojac, this.inkrementiran});
}
