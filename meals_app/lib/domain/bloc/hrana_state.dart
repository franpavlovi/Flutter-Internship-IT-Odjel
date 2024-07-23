part of 'hrana_bloc.dart';

sealed class HranaState {}

final class HranaInitial extends HranaState {}

final class HranaLoaded extends HranaState {
  List<Hrana>? hrana;
  HranaLoaded({List<Hrana>? hrana}) : hrana = hrana ?? [];
}

final class HranaLoadingstate extends HranaState {}

final class HranaErrorState extends HranaState {
  String? error;
  HranaErrorState({this.error});
}
