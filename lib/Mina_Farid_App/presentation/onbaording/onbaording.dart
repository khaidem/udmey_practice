import 'package:flutter/material.dart';
import 'package:practice_app/Mina_Farid_App/presentation/resources/color_manager.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.darkPrimary,
        body: const Scaffold(
            body: Center(child: Text('Wellcome to OnBaording'))));
  }
}
