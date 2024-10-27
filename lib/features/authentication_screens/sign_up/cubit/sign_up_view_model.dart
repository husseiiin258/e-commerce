import 'package:e_commerce/domain/use_cases/register_use_case.dart';
import 'package:e_commerce/features/authentication_screens/sign_up/cubit/sign_up_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterScreenViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var phoneController = TextEditingController();
  RegisterScreenViewModel({required this.registerUseCase})
      : super(RegisterInitialState());

  void register() async {
    emit(RegisterLoadingState());
    var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        rePasswordController.text,
        phoneController.text);
    either.fold((l){
      emit(RegisterErrorState(failures: l));
    }, (response){
      emit(RegisterSuccessState(responseEntity: response));

    });
  }
}
