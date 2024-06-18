import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/models/articles_model.dart';
part 'latest_news_states.dart';

class LatestNewsCubit extends Cubit<LatestNewsStates> {
  LatestNewsCubit() : super(LatestNewsInitialState());

  static LatestNewsCubit get(context) => BlocProvider.of(context);

  // Get news
  Future<List<ArticlesModel>> getNews({required String category, required Dio dio}) async {
    emit(LatestNewsGetNewsLoadingState());
    try {
      final response = await dio.get(
          'https://gnews.io/api/v4/search?country=eg&q=%D8%A7%D9%84%D8%B2%D8%B1%D8%A7%D8%B9%D8%A9%20%D8%A7%D9%84%D9%85%D8%B3%D8%AA%D8%AF%D8%A7%D9%85%D8%A9%20OR%20%D8%A7%D9%84%D8%B1%D9%8A&apikey=7ade9c8ce771581eb698a71ef64bb6f6');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticlesModel> articlesList = [];
      for (var article in articles) {
        ArticlesModel articlesModel = ArticlesModel.fromJson(article);
        articlesList.add(articlesModel);
      }
      emit(LatestNewsGetNewsSuccessState());
      return articlesList;
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(LatestNewsGetNewsErrorState(error.toString()));
      return [];
    }
  }
}
