import 'package:practice_app/Mina_Farid_App/data/data_source/data_source.dart';
import 'package:practice_app/Mina_Farid_App/data/mapper/mapper.dart';
import 'package:practice_app/Mina_Farid_App/data/network/network_info.dart';
import 'package:practice_app/Mina_Farid_App/domain/model.dart';
import 'package:practice_app/Mina_Farid_App/app/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:practice_app/Mina_Farid_App/domain/repository.dart';

///Check for InterNet Connection
class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImpl(this._networkInfo, this._remoteDataSource);
  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest, loginRequest) async {
    if (await _networkInfo.isConnected) {
      final response = await _remoteDataSource.login(loginRequest);
      if (response.status == 0) {
        return Right(response.toDomain());
      } else {
        return Left(
            Failure(409, response.message ?? "we have error in api logic"));
      }
    } else {
      return Left(Failure(501, "please check connection"));
    }
  }
}
