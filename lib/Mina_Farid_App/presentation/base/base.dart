abstract class BaseViewModel extends BaseViewModelInput
    with BaseViewModelOutput {
  //**Share variable and function that will be used through any view model */
}

abstract class BaseViewModelInput {
  void start();
  void dispose();
}

abstract class BaseViewModelOutput {}
