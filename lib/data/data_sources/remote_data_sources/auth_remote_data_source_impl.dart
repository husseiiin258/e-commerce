import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api_manager.dart';
import 'package:e_commerce/data/data_sources/remote_data_sources/auth_remote_data_source.dart';
import 'package:e_commerce/data/end_point.dart';
import 'package:e_commerce/data/model/RegisterResponseDm.dart';

import 'package:e_commerce/domain/failures.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;
  AuthRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, RegisterResponseDto>> register(String name,
      String email, String password, String rePassword, String phone) async {
    var checkResult = await Connectivity().checkConnectivity();
    if (checkResult == ConnectivityResult.wifi ||
        checkResult == ConnectivityResult.mobile) {
      var response = await apiManager.postDate(EndPoint.register, body: {
        "name": name,
        "email": email,
        "password": password,
        "rePassword": rePassword,
        "phone": phone
      });

      var registerResponse = RegisterResponseDto.fromJson(response.data);
      if(response.statusCode!>= 200 && response.statusCode!<300){
        return Right(registerResponse);
      }else{
        return Left(ServerError(errorMsg: registerResponse.message!));
      }
    }else{
      return Left(NetworkError(errorMsg: "No internet connection"));
    }
  }
}
