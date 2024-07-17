import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestInitial()) {
    on<AddItemEvent>(addItemToList);
    on<TestInitialEvent>((event, emit) => emit(TestInitial()));
  }

  Future addItemToList(AddItemEvent event, Emitter emit) async {
    List<String> listatroskova = [];
    if (state is TestLoadedState) {
      listatroskova = (state as TestLoadedState).listatroskova!;
    }
    emit(TestLoadingstate());
    final response = await Future.delayed(const Duration(seconds: 2));
    emit(
      TestLoadedState(
        listatroskova: [...listatroskova, event.item],
      ),
    );
  }
}
