part of 'zadatak_bloc.dart';

@immutable
abstract class ZadatakState {}

final class ZadatakInitial extends ZadatakState {}

final class ZadatakLoaded extends ZadatakState {
  final List<Zadatak> zadatakList;

  ZadatakLoaded(
    this.zadatakList,
  );
}

final class ZadatakLoading extends ZadatakState {}

final class ZadatakError extends ZadatakState {}
