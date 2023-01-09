import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_app/Weather_APP/logic_bloc/temp_setting/temp_settings_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: ListTile(
          title: const Text('Temperature Unit'),
          subtitle: const Text('Celsius/Fahrenheit'),
          trailing: Switch(
            value: context.watch<TempSettingsBloc>().state.tempUnit ==
                TempUnitBloc.celsius,
            onChanged: (_) {
              context.read<TempSettingsBloc>().add(ToggleTempUnitEvent());
            },
            //**For Cubit */
            // value: context.watch<TempSettingsCubit>().state.tempUnit ==
            //     TempUnit.celsius,
            // onChanged: (_) {
            //   context.read<TempSettingsCubit>().toggle();
            // },
          ),
        ),
      ),
    );
  }
}
