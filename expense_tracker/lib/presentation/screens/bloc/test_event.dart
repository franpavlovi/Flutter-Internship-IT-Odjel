part of 'test_bloc.dart';

@immutable
sealed class TestEvent {}

class TestInitialEvent extends TestEvent {}

class AddItemEvent extends TestEvent {
  final String item;
  AddItemEvent({required this.item});
}
