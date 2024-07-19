import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestInitial()) {
    on<AddItemEvent>(addItemToList);
    on<TestInitialEvent>(initializeTest);
  }

  Future initializeTest(TestInitialEvent event, Emitter emit) async {
    emit(TestInitial());
  }

  Future addItemToList(AddItemEvent event, Emitter emit) async {
    List<String> listatroskova = [];
    emit(TestLoadingstate());
    final response = await Future.delayed(const Duration(seconds: 2));
    if (state is TestLoadedState) {
      listatroskova = (state as TestLoadedState).listatroskova!;
    }
    emit(
      TestLoadedState(
        listatroskova: [...listatroskova, event.item],
      ),
    );
  }
}
