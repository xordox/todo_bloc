part of 'theme_bloc.dart';

 class ThemeState extends Equatable {
  final bool darkMode;
  const ThemeState({required this.darkMode});
  
  @override
  List<Object> get props => [darkMode];
}

class ThemeInitial extends ThemeState {
  const ThemeInitial({required bool darkMode}) : super(darkMode: darkMode);
}
