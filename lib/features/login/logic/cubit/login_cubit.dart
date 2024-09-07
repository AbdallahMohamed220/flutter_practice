import 'package:flutter_application_practice/features/login/data/models/login_request_body.dart';
import 'package:flutter_application_practice/features/login/data/repos/login_repo.dart';
import 'package:flutter_application_practice/features/login/logic/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(const LoginState.initial());

  Future<void> login(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());

    final result = await loginRepo.login(loginRequestBody);
    result.when(
      success: (response) => emit(LoginState.success(response)),
      failure: (message) => emit(
        LoginState.error(message: message.apiErrorModel.message),
      ),
    );
  }
}
