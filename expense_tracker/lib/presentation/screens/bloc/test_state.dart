part of 'test_bloc.dart';

abstract class TestState {}

final class TestInitial extends TestState {}

final class TestLoadedState extends TestState {
  List<String>? listatroskova;
  TestLoadedState({
    List<String>? listatroskova,
  }) : listatroskova = listatroskova ?? [];
}

final class TestLoadingstate extends TestState {}

final class TestErrorState extends TestState {
  String? error;
  TestErrorState({this.error});
}
