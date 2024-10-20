import 'package:e_commerce/domain/entities/RegisterResponseEntity.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/failures.dart';
abstract class AuthRepository{

 Future<Either<Failures , RegisterResponseEntity>> register(String name , String email ,String password , String rePassword , String phone );
}