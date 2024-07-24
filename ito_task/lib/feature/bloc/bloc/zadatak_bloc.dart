import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'zadatak_event.dart';
part 'zadatak_state.dart';

class ZadatakBloc extends Bloc<ZadatakEvent, ZadatakState> {
  ZadatakBloc() : super(ZadatakInitial()) {
    on<ZadatakEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
