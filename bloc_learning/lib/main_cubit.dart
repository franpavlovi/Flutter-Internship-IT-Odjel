import 'package:bloc/bloc.dart';

//Cubit je BLoC u malom , on je specijalna komponenta streama
//poziva se pomoću funkcija preko UI-a
//tri stvari koje se moram zapitat kada idem definirati Cubit:
//koje je inicijalno stanje? - koje su moguće interakcije sa aplikacijom? - koje su to onda funckije?
//funkcije koje se triggeraju nisu dio streama vec su lista predefiniranih opcija koje su moguće u tom Cubitu

class BrojacCubit extends Cubit<int> {
  //Cubit<int> je klasa koja radi sa integer stanjima

  BrojacCubit() : super(5); //konstruktor inicijalizira početno stanje na 0

  void povecaj() => emit(state + 1); //definiramo funkcije (triggere)
  void smanji() => emit(state - 1);
}

void main() {
  final brojacCubit = BrojacCubit();

  print(brojacCubit.state);

  brojacCubit.povecaj();
  brojacCubit.povecaj();
  brojacCubit.povecaj();
  brojacCubit.povecaj();

  print(brojacCubit.state);

  brojacCubit.smanji();
  brojacCubit.smanji();

  print(brojacCubit.state);
}
