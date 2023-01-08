part of 'theme_data_bloc.dart';

abstract class ThemeDataEvent extends Equatable {
  const ThemeDataEvent();

  @override
  List<Object> get props => [];
}

class ChangeThemeEvent extends ThemeDataEvent {
  final AppThemeData appTheme;
  const ChangeThemeEvent({
    required this.appTheme,
  });
  @override
  List<Object> get props => [appTheme];
}
