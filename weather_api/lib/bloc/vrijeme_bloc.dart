import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';
import 'package:weather_api/domain/data/consts.dart';
import 'package:weather_api/domain/models/podaci_vrijeme.dart';

part 'vrijeme_event.dart';
part 'vrijeme_state.dart';

class VrijemeBloc extends Bloc<VrijemeEvent, VrijemeState> {
  VrijemeBloc() : super(VrijemeInitial()) {
    on<LoadVrijeme>(loadWeather);
  }

  Future loadWeather(LoadVrijeme event, Emitter emit) async {
    emit(LoadingVrijeme());

    WeatherFactory wf = WeatherFactory(APIKEY);
    Weather w = await wf.currentWeatherByCityName(event.imeGrada);
    PodaciVrijeme podaciVrijeme = PodaciVrijeme(
      imeGrada: event.imeGrada,
      vrijeme: w.weatherMain ?? '',
      temperatura: w.temperature?.celsius?.roundToDouble() ?? 0,
      vlaznost: (w.humidity ?? 0).toInt(),
    );

    await Future.delayed(const Duration(seconds: 3));

    emit(LoadedVrijeme(podaciVrijeme: podaciVrijeme));
  }
}
