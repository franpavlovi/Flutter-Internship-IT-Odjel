part of 'zadatak_bloc.dart';

abstract class ZadatakEvent {}

final class CreateZadatakEvent extends ZadatakEvent {
  final Zadatak zadatak;

  CreateZadatakEvent({required this.zadatak});
}

final class GetZadaciEvent extends ZadatakEvent {
  final List<Zadatak> zadatak;

  GetZadaciEvent({required this.zadatak});
}

final class UpdateZadatakEvent extends ZadatakEvent {
  final Zadatak zadatak;

  UpdateZadatakEvent({required this.zadatak});
}

final class DeleteZadatak extends ZadatakEvent {
  final Zadatak zadatak;

  DeleteZadatak({required this.zadatak});
}
