part of 'filtrirana_hrana_bloc.dart';

@immutable
sealed class FiltriranaHranaEvent {}

final class FiltrirajHranuEvent extends FiltriranaHranaEvent {
  final Kategorija kategorija;
  FiltrirajHranuEvent({required this.kategorija});
}
