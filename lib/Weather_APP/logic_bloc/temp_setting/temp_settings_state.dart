// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'temp_settings_bloc.dart';

enum TempUnit {
  celsius,
  fahrenheit,
}

class TempSettingsState extends Equatable {
  const TempSettingsState({this.tempUnit = TempUnit.celsius});
  final TempUnit tempUnit;
  factory TempSettingsState.initial() {
    return TempSettingsState();
  }

  @override
  List<Object> get props => [tempUnit];

  @override
  bool get stringify => true;

  TempSettingsState copyWith({
    TempUnit? tempUnit,
  }) {
    return TempSettingsState(
      tempUnit: tempUnit ?? this.tempUnit,
    );
  }
}
