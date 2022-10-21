import 'package:dartz/dartz.dart';
import 'package:practice_app/Mina_Farid_App/domain/model.dart';

import '../app/failure.dart';

abstract class Repository {
  //**Either is form dartz package */
  Future<Either<Failure, Authentication>> login(LoginRequest, loginRequest);
}
