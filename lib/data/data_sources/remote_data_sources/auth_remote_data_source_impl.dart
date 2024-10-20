import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/data_sources/remote_data_sources/auth_remote_data_source.dart';
import 'package:e_commerce/data/model/RegisterResponseDm.dart';

import 'package:e_commerce/domain/failures.dart';

 class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  @override
  Future<Either<Failures, RegisterResponseDto>> register(String name, String email, String password, String rePassword, String phone) {

  }

}