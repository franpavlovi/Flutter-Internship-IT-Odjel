part of 'vrijeme_bloc.dart';

@immutable
abstract class VrijemeEvent {}

class LoadVrijeme extends VrijemeEvent {
  final String imeGrada;
  LoadVrijeme({
    required this.imeGrada,
  });
}
