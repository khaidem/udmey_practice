// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_data_bloc.dart';

enum AppThemeData { light, dark }

class ThemeDataState extends Equatable {
  const ThemeDataState({
    this.appThemeData = AppThemeData.light,
  });
  final AppThemeData appThemeData;

  factory ThemeDataState.initial() {
    return const ThemeDataState();
  }

  @override
  List<Object> get props => [appThemeData];

  @override
  bool get stringify => true;

  ThemeDataState copyWith({
    AppThemeData? appThemeData,
  }) {
    return ThemeDataState(
      appThemeData: appThemeData ?? this.appThemeData,
    );
  }
}
