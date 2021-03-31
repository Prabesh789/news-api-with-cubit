import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/models/news_model.dart';
import 'package:newsapi/repositories/news_repositories.dart';

part 'news_api_state.dart';

class NewsApiCubit extends Cubit<NewsApiState> {
  NewsRepositories _newsRepositories;
  NewsApiCubit({@required NewsRepositories newsRepositories})
      : assert(newsRepositories != null),
        _newsRepositories = newsRepositories,
        super(NewsInitial());

  Future<void> fetchNews({String countryCode, String category}) async {
    emit(NewsLoadingState());
    final response = await _newsRepositories.getNews(
        counrtyCode: countryCode, newsCategory: category);
    if (response != null) {
      emit(NewsLoadedState(newsModel: response));
    } else {
      emit(
        NewsErrorState(errorMessage: 'Failed to load....!'),
      );
    }
  }
}
