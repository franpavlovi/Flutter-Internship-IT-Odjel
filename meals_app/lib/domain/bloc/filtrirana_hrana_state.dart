part of 'filtrirana_hrana_bloc.dart';

@immutable
sealed class FiltriranaHranaState {}

final class FiltriranaHranaInitial extends FiltriranaHranaState {}

final class FiltriranaHranaLoading extends FiltriranaHranaState {}

final class FiltriranaHranaLoaded extends FiltriranaHranaState {
  final List<Hrana>? filtriranaJela;

  FiltriranaHranaLoaded({
    List<Hrana>? filtriranaJela,
  }) : filtriranaJela = filtriranaJela ?? [];
}

final class FiltriranaHranaError extends FiltriranaHranaState {}
