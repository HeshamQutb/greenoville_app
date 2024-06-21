import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/features/tips_view/data/models/tips_model.dart';
import 'package:intl/intl.dart';

import 'tips_states.dart';

class TipsCubit extends Cubit<TipsStates> {
  TipsCubit() : super(TipsInitState());

  static TipsCubit get(context) => BlocProvider.of(context);

  bool isArabic() {
    return Intl.getCurrentLocale() == 'ar';
  }

  // Get Tips
  Future<List<TipsModel>> geTips({String? uid}) async {
    emit(GetTipsLoadingState());
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('tips').get();

      if (querySnapshot.docs.isEmpty) {
        // Return an empty list if there are no documents in the collection
        emit(GetTipsSuccessState([]));
        return <TipsModel>[];
      } else {
        List<TipsModel> tips = [];
        for (var doc in querySnapshot.docs) {
          var data = doc.data() as Map<String, dynamic>;
          var userDoc = await FirebaseFirestore.instance
              .collection('users')
              .doc(data['uId'])
              .get();
          if (userDoc.data() != null) {
            var userData = userDoc.data() as Map<String, dynamic>;
            var tip = TipsModel.fromJson({
              ...data,
              'isVerified': userData['isVerified'],
              'bio': userData['bio'],
              'coverImage': userData['coverImage'],
              'userRole': userData['userRole'],
              'userName': userData['userName'],
              'userImage': userData['userImage'],
            });

            // Filter tips based on uid (if provided)
            if (uid == null || data['uId'] == uid) {
              tips.add(tip);
            }
          }
        }
        emit(GetTipsSuccessState(tips));
        return tips;
      }
    } catch (error) {
      emit(GetTipsErrorState(error.toString()));
      rethrow;
    }
  }

}
