import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:ito_task/feature/domain/models/zadatak.dart';
import 'package:meta/meta.dart';

part 'zadatak_event.dart';
part 'zadatak_state.dart';

class ZadatakBloc extends Bloc<ZadatakEvent, ZadatakState> {
  ZadatakBloc() : super(ZadatakInitial()) {
    on<CreateZadatakEvent>(createZadatak);
    on<GetZadaciEvent>(getZadaci);
  }
}

Future createZadatak(CreateZadatakEvent event, Emitter emit) async {
  emit(ZadatakLoading());
  try {
    var url = Uri.parse('https://fir-task-menanger-default-rtdb.europe-west1.firebasedatabase.app/users/003/task/.json');
    var response = await http.post(url,
        body: jsonEncode({
          'title': event.zadatak.imeZadatka,
          'text': event.zadatak.opisZadatka,
          'isActive': event.zadatak.isActive,
        }));
    if (response.statusCode == 200) {
      emit(ZadatakLoaded([event.zadatak]));
    }
  } catch (e) {
    emit(ZadatakError());
  }
}

Future getZadaci(GetZadaciEvent event, Emitter emit) async {
  emit(ZadatakLoading());

  try {
    var url = Uri.parse('https://fir-task-menanger-default-rtdb.europe-west1.firebasedatabase.app/users/003/task/.json');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<Zadatak> zadatakList = [];
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      data.forEach((key, value) {
        zadatakList.add(Zadatak(
          imeZadatka: value['title'],
          opisZadatka: value['text'],
          isActive: value['isActive'],
        ));
      });

      emit(ZadatakLoaded(zadatakList));
    }
  } catch (e) {
    emit(ZadatakError());
  }
}
