part of 'zadatak_bloc.dart';

@immutable
abstract class ZadatakEvent {}

final class CreateZadatakEvent extends ZadatakEvent {
  final Zadatak zadatak;

  CreateZadatakEvent({required this.zadatak});
}
