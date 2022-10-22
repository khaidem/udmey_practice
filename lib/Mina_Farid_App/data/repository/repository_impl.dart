import 'package:practice_app/Mina_Farid_App/data/data_source/data_source.dart';
import 'package:practice_app/Mina_Farid_App/data/mapper/mapper.dart';
import 'package:practice_app/Mina_Farid_App/data/network/app_handler.dart';
import 'package:practice_app/Mina_Farid_App/data/network/network_info.dart';
import 'package:practice_app/Mina_Farid_App/domain/model/model.dart';
import 'package:practice_app/Mina_Farid_App/app/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:practice_app/Mina_Farid_App/domain/repository/repository.dart';

///Check for InterNet Connection
class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImpl(this._networkInfo, this._remoteDataSource);
  @override

  ///if we are handle error with clean syntax we can follow Either provide
  ///two things left and right
  Future<Either<Failure, Authentication>> login(
      LoginRequest, loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(response.status ?? ApiInternalStatus.FAILURE,
                response.message ?? ResponseMessage.DAFULT),
          );
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(
        DataSource.NO_INTERNET_CONNCECTION.getFailure(),
      );
    }
  }
}
