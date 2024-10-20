import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/data_sources/remote_data_sources/auth_remote_data_source.dart';
import 'package:e_commerce/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:e_commerce/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name, String email, String password,
      String rePassword, String phone) async{
    var either =await authRemoteDataSource.register(name, email, password, rePassword, phone);
    return either.fold(
        (error) => Left(error),
        (response) => Right(response));
  }

}