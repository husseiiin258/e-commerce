import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/RegisterResponseDm.dart';
import 'package:e_commerce/domain/entities/RegisterResponseEntity.dart';


import '../../../domain/failures.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone);
}
