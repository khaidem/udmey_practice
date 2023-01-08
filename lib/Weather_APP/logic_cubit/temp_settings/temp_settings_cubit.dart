import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'temp_settings_state.dart';

class TempSettingsCubit extends Cubit<TempSettingsState> {
  TempSettingsCubit() : super(TempSettingsState.initial());
  void toggle() {
    emit(
      state.copyWith(
          tempUnit: state.tempUnit == TempUnit.celsius
              ? TempUnit.fahrenheit
              : TempUnit.celsius),
    );
    log('Toogle: $state');
  }
}
