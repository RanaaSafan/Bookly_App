


import 'package:booky_app/features/home/data/repo/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../api_service.dart';

final getIt= GetIt.instance;

void setUp(){

   getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(apiservice:ApiService(Dio()))) ;
}