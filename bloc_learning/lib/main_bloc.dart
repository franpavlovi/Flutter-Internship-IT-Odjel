import 'package:bloc/bloc.dart';

enum BlocEvent { povecaj, smanji }

class BrojacBloc extends Bloc<BlocEvent, int> {
  BrojacBloc() : super(0) {
    //inicijaliziramo početno stanje na 0
    on<BlocEvent>(_mapEventToState); //i dodamo metodu koja hendluje eventove
  }

  void _mapEventToState(BlocEvent event, Emitter<int> emit) {
    switch (event) {
      case BlocEvent.povecaj:
        emit(state + 1);
        break;
      case BlocEvent.smanji:
        if (state > 0) {
          emit(state - 1);
        }
        break;
    }
  }
}

void main() {
  final brojacBloc = BrojacBloc();

  print(brojacBloc.state);

  brojacBloc.add(BlocEvent.povecaj);
  brojacBloc.add(BlocEvent.povecaj);
  brojacBloc.add(BlocEvent.povecaj);
  brojacBloc.add(BlocEvent.povecaj);

  Future.delayed(Duration(seconds: 1), () {
    print(brojacBloc.state);

    brojacBloc.add(BlocEvent.smanji);
    brojacBloc.add(BlocEvent.smanji);
    brojacBloc.add(BlocEvent.smanji);

    Future.delayed(Duration(seconds: 1), () {
      print(brojacBloc.state);
    });
  });
}
