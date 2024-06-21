import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/tips_model.dart';
import 'add_tips_states.dart';

class AddTipsCubit extends Cubit<AddTipsStates> {
  AddTipsCubit() : super(AddTipsInitialState());

  static AddTipsCubit get(context) => BlocProvider.of(context);

  void addNewTips({
    required String uId,
    required String description,
    required String tipsId,
  }) {
    emit(AddTipsLoadingState());
    TipsModel tipsModel = TipsModel(
      uId: uId,
      description: description,
      tipsId: tipsId,
    );
    FirebaseFirestore.instance
        .collection('tips')
        .doc(tipsId)
        .set(tipsModel.toMap())
        .then((value) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .update({'hasTips': true}).then((_) {
        emit(AddTipsSuccessState());
      }).catchError((error) {
        emit(AddTipsErrorState(error.toString()));
      });
    }).catchError((error) {
      emit(AddTipsErrorState(error.toString()));
    });
  }
}
