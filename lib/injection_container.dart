
import 'package:http/http.dart' as http;

import 'package:get_it/get_it.dart';
import 'package:necessities/login/data/data_source/remote/login_service.dart';
import 'package:necessities/login/data/repository/login_repository_impl.dart';
import 'package:necessities/login/domain/repository/login_repository.dart';
import 'package:necessities/login/domain/usecases/LoginUseCase.dart';
import 'package:necessities/login/presentation/blocs/login/login_bloc.dart';


final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  // Dio
  sl.registerSingleton<http.Client>(http.Client());

  // Dependencies
  sl.registerSingleton<LoginService>(LoginService(sl()));

   sl.registerSingleton<LoginRepository>(
    LoginRepositoryImpl(sl())
  );
  
  //UseCases
  sl.registerSingleton<LoginUseCase>(
    LoginUseCase(sl())
  );


  //Blocs
  sl.registerFactory<LoginBloc>(
    ()=> LoginBloc(sl())
  );



}