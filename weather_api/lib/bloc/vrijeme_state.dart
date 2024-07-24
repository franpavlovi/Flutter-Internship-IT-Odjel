part of 'vrijeme_bloc.dart';

@immutable
abstract class VrijemeState {}

final class VrijemeInitial extends VrijemeState {}

final class LoadedVrijeme extends VrijemeState {
  final PodaciVrijeme podaciVrijeme;
  LoadedVrijeme({
    required this.podaciVrijeme,
  });
}

final class LoadingVrijeme extends VrijemeState {}

final class ErrorVrijeme extends VrijemeState {
  final String message;

  ErrorVrijeme({
    required this.message,
  });
}
