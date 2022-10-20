import 'dart:async';

import 'package:practice_app/Mina_Farid_App/domain/model.dart';
import 'package:practice_app/Mina_Farid_App/presentation/base/base_view_model.dart';

import '../resources/assets_manager.dart';
import '../resources/string_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOuput {
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;
//** stream => It is a pipe , you put a value on the one end and if there
//** a listener on the other end that listener will receive that value */ */

//** A stream can have multiple listner and all of those listner will recieve
//** the same value when it put in the pipeline. The way we  put valuee on a stream
//* is by using a StramController */ */

//** Stream are the output of StreamController */

//** Sink => A sink resemble a stream that flow the other way. Adding information
//*into an associated stream */
//* Sink is the input of StramController

//** Stream controller => Inprove stream managements, naturally make a stream and
//*sink and give technique to controller a stream conduct */

  //** input  */
  @override
  void dispose() {
    _streamController.close();
  }

//**  */
  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goPrevious() {
    int previousIndex = _currentIndex--;
    if (previousIndex == -1) {
      _currentIndex = _list.length - 1;
    }

    return _currentIndex;
  }

  @override
  int gotNext() {
    int nextIndex = _currentIndex++;
    if (nextIndex >= _list.length) {
      _currentIndex = 0;
    }
    return _currentIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  // TODO: implement outputSliderViewObject
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((SliderViewObject) => SliderViewObject);

  ///Slider page Route
  ///==================
  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingSubTitle1,
            AppStrings.onBoardingSubTitle1, ImageAssets.onboardingLogo1),
        SliderObject(AppStrings.onBoardingSubTitle2,
            AppStrings.onBoardingSubTitle2, ImageAssets.onboardingLogo2),
        SliderObject(AppStrings.onBoardingSubTitle3,
            AppStrings.onBoardingSubTitle3, ImageAssets.onboardingLogo3),
        SliderObject(AppStrings.onBoardingSubTitle4,
            AppStrings.onBoardingSubTitle4, ImageAssets.onboardingLogo4),
      ];
  _postDataToView() {
    inputSliderViewObject.add(
        SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }
}

//** inputs mean the order that our view model will receive form our view */
abstract class OnBoardingViewModelInputs {
  void gotNext(); //**user click on right arrow or swip left*/
  void goPrevious(); //** user click on left arrow or swipe right  */
  void onPageChanged(int index);
//+++++++++++++++++++++++++++++++++++++
// this is the way to add data to the stream .. stream input
  @override
  Sink get inputSliderViewObject;
}

//** Outputs mean data or result that will be sent form our view model to our view */
abstract class OnBoardingViewModelOuput {
  Stream<SliderViewObject> get outputSliderViewObject;
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;
  SliderViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}
