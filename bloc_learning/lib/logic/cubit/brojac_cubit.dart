import 'package:bloc/bloc.dart';

part 'brojac_state.dart';

class BrojacCubit extends Cubit<BrojacState> {
  BrojacCubit() : super(BrojacState(brojac: 0));
  //konstruktor ove klase nasljeđuje podatke iz nadklase BrojacState te iste podatke postavlja u konstruktor
  //nesto kao u javi kad postavim super();

  void povecaj() => emit(BrojacState(brojac: state.brojac + 1, inkrementiran: true));
  void smanji() => emit(BrojacState(brojac: state.brojac - 1, inkrementiran: false));
  //implementirali smo funkcije koje ce emitirati novi state brojaca
}
