import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:newsapi/cubits/news_api/news_api_cubit.dart';
import 'package:newsapi/repositories/news_repositories.dart';

final GetIt inject = GetIt.instance;

Future<void> initDependencyInjection() async {
  WidgetsFlutterBinding.ensureInitialized();
  _newsRepositories();
  _newsCubit();
}

void _newsRepositories() {
  inject.registerLazySingleton(() => NewsRepositories());
}

void _newsCubit() {
  inject.registerLazySingleton(() => NewsApiCubit(newsRepositories: inject()));
}
