part of 'news_api_cubit.dart';

abstract class NewsApiState extends Equatable {}

class NewsInitial extends NewsApiState {
  @override
  List<Object> get props => [];
}

class NewsLoadingState extends NewsApiState {
  @override
  List<Object> get props => [];
}

class NewsLoadedState extends NewsApiState {
  final NewsModel newsModel;

  NewsLoadedState({this.newsModel});
  @override
  List<Object> get props => [];
}

class NewsErrorState extends NewsApiState {
  final String errorMessage;

  NewsErrorState({this.errorMessage});
  @override
  List<Object> get props => [];
}
