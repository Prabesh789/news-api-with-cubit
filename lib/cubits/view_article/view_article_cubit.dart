import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'view_article_state.dart';

class ViewArticleCubit extends Cubit<ViewArticleState> {
  ViewArticleCubit() : super(ViewArticleInitial());
}
