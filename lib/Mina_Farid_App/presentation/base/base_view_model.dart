abstract class BaseViewModel extends BaseViewModelInput
    with BaseViewModelOutput {
  //**Share variable and function that will be used through any view model */
}

abstract class BaseViewModelInput {
  void start(); // will be called while init. of view model
  void dispose(); // will be called when viewModel dies
}

abstract class BaseViewModelOutput {}
