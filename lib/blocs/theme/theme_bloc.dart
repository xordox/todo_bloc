import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeInitial(darkMode: false)) {
    on<DarkThemeEvent>((event, emit) {
      emit(const ThemeState(darkMode: true),);
    });
    on<LightThemeEvent>((event, emit) => 
    emit(const ThemeState(darkMode: false)));
  }
}
