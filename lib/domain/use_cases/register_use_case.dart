import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/RegisterResponseEntity.dart';
import '../failures.dart';

@injectable
class RegisterUseCase {
  AuthRepository registerRepository;
  RegisterUseCase({required this.registerRepository});

  Future<Either<Failures, RegisterResponseEntity>> invoke(String name,
      String email, String password, String rePassword, String phone) {
    return registerRepository.register(
        name, email, password, rePassword, phone);
  }
}
