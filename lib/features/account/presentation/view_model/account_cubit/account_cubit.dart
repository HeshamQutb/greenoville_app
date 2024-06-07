import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../auth/data/models/user_model.dart';
import '../../../../community/data/models/community_post_model.dart';
import '../../../../market/data/market_farm_model.dart';
import 'account_states.dart';

class AccountCubit extends Cubit<AccountStates> {
  AccountCubit() : super(AccountInitState());

  static AccountCubit get(context) => BlocProvider.of(context);


  // Get User Data
  Future<UserModel> getUserData({required BuildContext context}) async {
    if (uId != null) {
      emit(AccountGetUserLoadingState());
      try {
        final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uId).get();
        if (snapshot.exists) {
          UserModel userModel;
          var userData = snapshot.data();
          print(uId);
          print(userData);
          userModel = UserModel.fromJson(userData!);
          emit(AccountGetUserSuccessState());
          return userModel; // Return the userModel here
        } else {
          emit(AccountGetUserErrorState("User data not found"));
          return Future.error("User data not found"); // Return an error future
        }
      } catch (error) {
        emit(AccountGetUserErrorState(error.toString()));
        return Future.error(error.toString()); // Return an error future
      }
    } else {
      emit(AccountGetUserNullState("User ID is null"));
      return Future.error("User ID is null"); // Return an error future
    }
  }

  // Get Posts
  Future<List<CommunityPostModel>> getPosts({String? uid}) async {
    emit(AccountGetPostLoadingState());
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('posts')
          .orderBy('timestamp', descending: true)
          .get();

      if (querySnapshot.docs.isEmpty) {
        // Return an empty list if there are no documents in the collection
        emit(AccountGetPostSuccessState([]));
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
              'isVerified': userData['isVerified'],
              'bio': userData['bio'],
              'coverImage': userData['coverImage'],
              'userRole': userData['userRole'],
              'userName': userData['userName'],
              'userImage': userData['userImage'],
            });

            // Filter posts based on uid (if provided)
            if (uid == null || data['uId'] == uid) {
              posts.add(post);
            }
          }
        }
        emit(AccountGetPostSuccessState(posts));
        return posts;
      }
    } catch (error) {
      emit(AccountGetPostErrorState(error.toString()));
      rethrow;
    }
  }

  // Get Farms
  Future<List<MarketFarmModel>> getFarms({String? uid}) async {
    emit(AccountGetFarmLoadingState());
    try {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('farms').get();

      if (querySnapshot.docs.isEmpty) {
        // Return an empty list if there are no documents in the collection
        emit(AccountGetFarmSuccessState([]));
        return <MarketFarmModel>[];
      } else {
        List<MarketFarmModel> farms = [];
        for (var doc in querySnapshot.docs) {
          var data = doc.data() as Map<String, dynamic>;
          var userDoc = await FirebaseFirestore.instance
              .collection('users')
              .doc(data['uId'])
              .get();
          if (userDoc.data() != null) {
            var userData = userDoc.data() as Map<String, dynamic>;
            var farm = MarketFarmModel.fromJson({
              ...data,
              'userName': userData['userName'],
              'userImage': userData['userImage'],
              'coverImage': userData['coverImage'],
              'userRole': userData['userRole'],
              'bio': userData['bio'],
              'isVerified': userData['isVerified'],
            });

            // Filter farms based on uid (if provided)
            if (uid == null || data['uId'] == uid) {
              farms.add(farm);
            }
          }
        }
        emit(AccountGetFarmSuccessState(farms));
        return farms;
      }
    } catch (error) {
      emit(AccountGetFarmErrorState(error.toString()));
      rethrow;
    }
  }
}
