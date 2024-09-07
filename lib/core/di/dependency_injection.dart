import 'package:dio/dio.dart';
import 'package:flutter_application_practice/core/networking/api_service.dart';
import 'package:flutter_application_practice/core/networking/dio_factory.dart';
import 'package:flutter_application_practice/features/login/data/repos/login_repo.dart';
import 'package:flutter_application_practice/features/login/logic/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() async {
  Dio dio = DioFactory.getDio();
  getIt.registerSingleton<ApiService>(ApiService(dio));

  getIt.registerSingleton<LoginRepo>(LoginRepo(getIt<ApiService>()));
  getIt.registerSingleton<LoginCubit>(LoginCubit(getIt<LoginRepo>()));
}
