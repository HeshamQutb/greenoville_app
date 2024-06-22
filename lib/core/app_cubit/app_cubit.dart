import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/app_cubit/app_states.dart';
import 'package:greenoville_app/core/services/sign_out.dart';
import 'package:greenoville_app/features/market_prices/data/product_model.dart';
import 'package:greenoville_app/features/root/presentation/views/root_view.dart';
import 'package:intl/intl.dart';
import '../../constants.dart';
import '../../features/auth/data/models/user_model.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/community/presentation/views/community_view.dart';
import '../../features/fertilizers/data/fertilizer_model.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/plants/data/plant_model.dart';
import '../../features/soils/presentation/views/soils_view.dart';
import '../../features/tools/data/tool_model.dart';
import '../../features/welcome/presentation/views/onboarding_view.dart';
import '../../features/learn/presentation/views/learn_view.dart';
import '../../features/market/presentation/views/market_view.dart';
import '../models/articles_model.dart';
import '../network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());
  static AppCubit get(context) => BlocProvider.of(context);

  bool isArabic() {
    return Intl.getCurrentLocale() == 'ar';
  }

  void selectLanguage({required String selectedLanguage}) {
    CacheHelper.setData(
      key: 'appLanguage',
      value: selectedLanguage,
    ).then((value) {
      emit(SelectLanguageState(selectedLanguage));
    });
  }

  String? getAppLanguage() {
    appLanguage = CacheHelper.getData(key: 'appLanguage');
    return appLanguage;
  }

  Widget getSplashNextScreen() {
    uId = CacheHelper.getData(key: 'uId');

    if (CacheHelper.getData(key: 'onBoarding') != null) {
      if (uId != null) {
        return const RootView();
      } else {
        return const LoginView();
      }
    } else {
      return const OnBoardingView();
    }
  }

  int currentIndex = 0;
  List<Widget> screens = [
    const HomeView(),
    const SoilsView(),
    const CommunityView(),
    const LearnView(),
    const MarketView(),
  ];

  void changeNavBar(int index) {
    currentIndex = index;
    emit(AppChangeNavBarState());
  }

  final PageController pageController = PageController();

  void setPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 1),
      curve: Curves.easeInOut,
    );
  }

  // Get User Data
  Future<UserModel> getUserData({required BuildContext context}) async {
    if (uId != null) {
      emit(AppGetUserLoadingState());
      try {
        final DocumentSnapshot<Map<String, dynamic>> snapshot =
            await FirebaseFirestore.instance.collection('users').doc(uId).get();
        if (snapshot.exists) {
          UserModel userModel;
          var userData = snapshot.data();
          print(uId);
          print(userData);
          userModel = UserModel.fromJson(userData!);
          kUserModel = userModel;
          emit(AppGetUserSuccessState());
          return userModel; // Return the userModel here
        } else {
          signOut(context);
          emit(AppGetUserErrorState("User data not found"));
          return Future.error("User data not found"); // Return an error future
        }
      } catch (error) {
        emit(AppGetUserErrorState(error.toString()));
        return Future.error(error.toString()); // Return an error future
      }
    } else {
      emit(AppGetUserNullState("User ID is null"));
      return Future.error("User ID is null"); // Return an error future
    }
  }

  // Get news
  Future<List<ArticlesModel>> getNews({required Dio dio, String? url}) async {
    emit(AppGetNewsLoadingState());
    try {
      final response = await dio.get(
        url ??
            'https://gnews.io/api/v4/search?country=eg&q=%D8%A7%D9%84%D8%B2%D8%B1%D8%A7%D8%B9%D8%A9%20%D8%A7%D9%84%D9%85%D8%B3%D8%AA%D8%AF%D8%A7%D9%85%D8%A9%20OR%20%D8%A7%D9%84%D8%B1%D9%8A&apikey=7ade9c8ce771581eb698a71ef64bb6f6',
      );
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticlesModel> articlesList = [];
      for (var article in articles) {
        ArticlesModel articlesModel = ArticlesModel.fromJson(article);
        articlesList.add(articlesModel);
      }
      emit(AppGetNewsSuccessState());
      return articlesList;
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(AppGetNewsErrorState(error.toString()));
      return [];
    }
  }

  // Get Products
  Future<List<ProductModel>> getAllProducts() async {
    emit(AppGetProductsLoadingState());
    List<ProductModel> allProducts = [];

    try {
      // Fetch all farm documents
      QuerySnapshot farmSnapshots =
          await FirebaseFirestore.instance.collection('farms').get();

      // For each farm, fetch the products from the subcollection
      for (var farmDoc in farmSnapshots.docs) {
        QuerySnapshot productSnapshots = await FirebaseFirestore.instance
            .collection('farms')
            .doc(farmDoc.id)
            .collection('products')
            .get();

        // Add each product to the list
        for (var productDoc in productSnapshots.docs) {
          ProductModel product =
              ProductModel.fromJson(productDoc.data() as Map<String, dynamic>);
          allProducts.add(product);
        }
      }
      emit(AppGetProductsSuccessState());
    } catch (e) {
      emit(AppGetProductsErrorState(e.toString()));
    }

    return allProducts;
  }

  // Search
  Stream<List<dynamic>> searchAllCollections({required String query}) async* {
    try {
      final queryLower = query.toLowerCase(); // Convert query to lowercase

      final plantsStream = FirebaseFirestore.instance
          .collection('plants')
          .orderBy('plantName')
          .snapshots();

      final toolsStream = FirebaseFirestore.instance
          .collection('tools')
          .orderBy('toolName')
          .snapshots();

      final fertilizersStream = FirebaseFirestore.instance
          .collection('fertilizers')
          .orderBy('fertilizerName')
          .snapshots();

      await for (var plantsSnapshot in plantsStream) {
        var plants = plantsSnapshot.docs
            .map((doc) => PlantModel.fromJson(doc.data()))
            .where(
                (plant) => plant.plantName.toLowerCase().contains(queryLower))
            .toList();

        await for (var toolsSnapshot in toolsStream) {
          var tools = toolsSnapshot.docs
              .map((doc) => ToolModel.fromJson(doc.data()))
              .where((tool) => tool.toolName.toLowerCase().contains(queryLower))
              .toList();

          await for (var fertilizersSnapshot in fertilizersStream) {
            var fertilizers = fertilizersSnapshot.docs
                .map((doc) => FertilizerModel.fromJson(doc.data()))
                .where((fertilizer) => fertilizer.fertilizerName
                    .toLowerCase()
                    .contains(queryLower))
                .toList();

            // Combine the results into a single list and yield it
            yield [...plants, ...tools, ...fertilizers];
            emit(AppSearchSuccessState());
          }
        }
      }
    } catch (error) {
      emit(AppSearchErrorState(error.toString()));
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }
}
