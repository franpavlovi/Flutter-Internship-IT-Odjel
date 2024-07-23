import 'package:bloc/bloc.dart';
import 'package:meals_app/domain/models/hrana.dart';

part 'hrana_event.dart';
part 'hrana_state.dart';

class HranaBloc extends Bloc<HranaEvent, HranaState> {
  HranaBloc() : super(HranaInitial()) {
    on<HranaEvent>((event, emit) {});
  }
}
