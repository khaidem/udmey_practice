import 'package:dio/dio.dart';
import 'package:practice_app/Mina_Farid_App/app/constant.dart';
import 'package:practice_app/Mina_Farid_App/data/response/base_response.dart';
import 'package:retrofit/retrofit.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServicesClint {
  factory AppServicesClint(Dio dio, {String baseUrl}) = _AppServicesClint;

  @POST("/customer/login")
  Future<AuthenticationResponse> login(
      @Field('email') String email,
      @Field('password') String password,
      @Field('imei') String imei,
      @Field("devicesType") String devicesType);
}
