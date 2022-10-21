import 'package:practice_app/Mina_Farid_App/data/network/app_api.dart';
import 'package:practice_app/Mina_Farid_App/data/request/request.dart';
import 'package:practice_app/Mina_Farid_App/data/response/base_response.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  final AppServicesClint _appServicesClint;
  RemoteDataSourceImplementer(this._appServicesClint);
  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServicesClint.login(loginRequest.email,
        loginRequest.password, loginRequest.imei, loginRequest.devicesType);
  }
}
