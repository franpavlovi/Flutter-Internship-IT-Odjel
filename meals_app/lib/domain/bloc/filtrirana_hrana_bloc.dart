import 'package:bloc/bloc.dart';
import 'package:meals_app/domain/models/kategorija.dart';
import 'package:meta/meta.dart';

import '../data/dummy_data.dart';
import '../models/hrana.dart';

part 'filtrirana_hrana_event.dart';
part 'filtrirana_hrana_state.dart';

class FiltriranaHranaBloc extends Bloc<FiltriranaHranaEvent, FiltriranaHranaState> {
  FiltriranaHranaBloc() : super(FiltriranaHranaInitial()) {
    on<FiltrirajHranuEvent>(filtrirajHranu);
  }

  Future filtrirajHranu(FiltrirajHranuEvent event, Emitter emit) async {
    emit(FiltriranaHranaLoading());
    final filtriranaHrana = dummyHrana.where((hrana) => hrana.kategorija == event.kategorija.kategorija).toList();
    await Future.delayed(const Duration(seconds: 2));
    emit(FiltriranaHranaLoaded(filtriranaJela: filtriranaHrana));
  }
}
