import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/app_cubit/app_states.dart';
import 'package:greenoville_app/core/services/sign_out.dart';
import 'package:greenoville_app/features/community/data/models/community_comment_model.dart';
import 'package:greenoville_app/features/root/presentation/views/root_view.dart';
import 'package:intl/intl.dart';
import '../../constants.dart';
import '../../features/auth/data/models/user_model.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/community/data/models/community_like_model.dart';
import '../../features/community/data/models/community_post_model.dart';
import '../../features/community/presentation/views/community_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/soils/presentation/views/soils_view.dart';
import '../../features/welcome/presentation/views/onboarding_view.dart';
import '../../views/learn_view.dart';
import '../../views/market_view.dart';
import '../models/comment_model.dart';
import '../models/ike_model.dart';
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

  UserModel? userModel;
  // Get User Data
  void getUserData(context) async {
    if (uId != null) {
      emit(AppGetUserLoadingState());

      try {
        final DocumentSnapshot<Map<String, dynamic>> snapshot =
            await FirebaseFirestore.instance.collection('users').doc(uId).get();

        if (snapshot.exists) {
          var userData = snapshot.data();
          print(uId);
          print(userData);

          userModel = UserModel.fromJson(userData!);
          emit(AppGetUserSuccessState());
        } else {
          signOut(context);
          emit(AppGetUserErrorState("User data not found"));
        }
      } catch (error) {
        print("Error fetching user data: $error");
        emit(AppGetUserErrorState(error.toString()));
      }
    } else {
      emit(AppGetUserNullState("User ID is null"));
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

  // Get Posts
  Future<List<CommunityPostModel>> getPosts() async {
    emit(CommunityGetPostLoadingState());
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('posts')
          .orderBy('timestamp', descending: true)
          .get();

      if (querySnapshot.docs.isEmpty) {
        // Return an empty list if there are no documents in the collection
        emit(CommunityGetPostSuccessState([]));
        return <CommunityPostModel>[];
      } else {
        List<CommunityPostModel> posts = [];
        for (var doc in querySnapshot.docs) {
          var data = doc.data() as Map<String, dynamic>;
          var userDoc = await FirebaseFirestore.instance
              .collection('users')
              .doc(data['uId'])
              .get();
          if (userDoc.data() != null) {
            var userData = userDoc.data() as Map<String, dynamic>;
            var post = CommunityPostModel.fromJson({
              ...data,
              'userName': userData['name'],
              'userImage': userData['image'],
            });
            posts.add(post);
          }
        }
        emit(CommunityGetPostSuccessState(posts));
        return posts;
      }
    } catch (error) {
      print(error.toString());
      emit(CommunityGetPostErrorState(error.toString()));
      rethrow;
    }
  }

  // Like Post
  Future<void> likePost({
    required String postId,
  }) async {
    try {
      DocumentReference likeRef = FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .collection('likes')
          .doc(uId);

      // Check if the user has already liked the post
      DocumentSnapshot likeSnapshot = await likeRef.get();

      if (likeSnapshot.exists) {
        // User has already liked the post, so remove the like
        await likeRef.delete();
        emit(CommunityUnlikePostSuccessState());
      } else {
        // User hasn't liked the post yet, so add the like
        LikeModel like = LikeModel(
          uId: uId!,
          timestamp: Timestamp.now(),
        );
        await likeRef.set(like.toMap());
        emit(CommunityLikePostSuccessState());
      }
    } catch (error) {
      emit(CommunityLikePostErrorState(error.toString()));
    }
  }

  // Get Likes for a Post
  Stream<List<CommunityLikeModel>> getLikes({required String postId}) {
    return FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .snapshots()
        .asyncMap((snapshot) async {
      if (snapshot.docs.isEmpty) {
        // Return an empty list if there are no documents in the collection
        return <CommunityLikeModel>[];
      } else {
        List<CommunityLikeModel> likes = [];
        for (var doc in snapshot.docs) {
          var data = doc.data();
          final uId = data['uId'];
          var userDoc = await FirebaseFirestore.instance
              .collection('users')
              .doc(uId)
              .get();
          if (userDoc.exists) {
            var userData = userDoc.data() as Map<String, dynamic>;
            var like = CommunityLikeModel.fromJson({
              ...data,
              'userName': userData['name'],
              'userImage': userData['image'],
            });
            likes.add(like);
          }
        }
        return likes;
      }
    }).handleError((error) {
      emit(CommunityGetPostLikesErrorState(error.toString()));
    });
  }

  // Comment on Post
  Future<void> commentOnPost({
    required String postId,
    required String content,
  }) async {
    try {
      DocumentReference commentRef = FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .doc();

      CommentModel comment = CommentModel(
        uId: uId!,
        timestamp: Timestamp.now(),
        content: content,
      );
      await commentRef.set(comment.toMap());
      emit(CommunityCommentPostSuccessState());
    } catch (error) {
      emit(CommunityCommentPostErrorState(error.toString()));
    }
  }

  // Get Comments for a Post
  Stream<List<CommunityCommentModel>> getComments({required String postId}) {
    return FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .asyncMap((snapshot) async {
      if (snapshot.docs.isEmpty) {
        return <CommunityCommentModel>[];
      } else {
        List<CommunityCommentModel> comments = [];
        for (var doc in snapshot.docs) {
          var data = doc.data();
          final uId = data['uId'];
          var userDoc = await FirebaseFirestore.instance
              .collection('users')
              .doc(uId)
              .get();
          if (userDoc.exists) {
            var userData = userDoc.data() as Map<String, dynamic>;
            var comment = CommunityCommentModel.fromJson({
              ...data,
              'userName': userData['name'],
              'userImage': userData['image'],
            });
            comments.add(comment);
          }
        }
        return comments;
      }
    }).handleError((error) {
      emit(CommunityGetPostCommentErrorState(error.toString()));
    });
  }
}
