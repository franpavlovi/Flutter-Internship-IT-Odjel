import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:ito_task/feature/domain/models/zadatak.dart';

part 'zadatak_event.dart';
part 'zadatak_state.dart';

class ZadatakBloc extends Bloc<ZadatakEvent, ZadatakState> {
  ZadatakBloc() : super(ZadatakInitial()) {
    on<CreateZadatakEvent>(createZadatak);
    on<GetZadaciEvent>(getZadaci);
    on<UpdateZadatakEvent>(updateZadatak);
    on<DeleteZadatak>(deleteZadatak);
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
          id: key,
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

Future updateZadatak(UpdateZadatakEvent event, Emitter emit) async {
  emit(ZadatakLoading());

  try {
    var url = Uri.parse('https://fir-task-menanger-default-rtdb.europe-west1.firebasedatabase.app/users/003/task/${event.zadatak.id}/.json');
    var response = await http.put(
      url,
      body: jsonEncode(
        <String, dynamic>{
          'title': event.zadatak.imeZadatka,
          'text': event.zadatak.opisZadatka,
          'isActive': !event.zadatak.isActive,
        },
      ),
    );

    if (response.statusCode == 200) {}
  } catch (e) {
    emit(ZadatakError());
  }
}

Future deleteZadatak(DeleteZadatak event, Emitter emit) async {
  emit(ZadatakLoading());

  try {
    var url = Uri.parse('https://fir-task-menanger-default-rtdb.europe-west1.firebasedatabase.app/users/003/task/${event.zadatak.id}/.json');
    var response = await http.delete(url);

    if (response.statusCode == 200) {
      emit(ZadatakLoaded([]));
    }
  } catch (e) {
    emit(ZadatakError());
  }
}
