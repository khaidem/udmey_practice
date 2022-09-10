import 'package:practice_app/Mina_Farid_App/presentation/base/base.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOuput {
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
    // TODO: implement dispose
  }
//**  */
  @override
  void start() {
    // TODO: implement start
  }

  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }

  @override
  void gotNext() {
    // TODO: implement gotNext
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }
}

//** inputs mean the order that our view model will receive form our view */
abstract class OnBoardingViewModelInputs {
  void gotNext(); //**user click on right arrow or swip left*/
  void goPrevious(); //** user click on left arrow or swipe right  */
  void onPageChanged(int index);
}

//** Outputs mean data or result that will be sent form our view model to our view */
abstract class OnBoardingViewModelOuput {}
