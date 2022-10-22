import 'package:dartz/dartz.dart';
import 'package:practice_app/Mina_Farid_App/app/failure.dart';
import 'package:practice_app/Mina_Farid_App/app/function.dart';
import 'package:practice_app/Mina_Farid_App/data/request/request.dart';
import 'package:practice_app/Mina_Farid_App/domain/model/model.dart';
import 'package:practice_app/Mina_Farid_App/domain/repository/repository.dart';
import 'package:practice_app/Mina_Farid_App/domain/usecase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  final Repository _repository;
  LoginUseCase(this._repository);
  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    DeviceInfo deviceInfo = await getDevicesDetails();
    return await _repository.login(LoginRequest(
        input.email, deviceInfo.name, deviceInfo.identifirs, input.password));
  }
}

class LoginUseCaseInput {
  String email;
  String password;
  LoginUseCaseInput(this.email, this.password);
}
